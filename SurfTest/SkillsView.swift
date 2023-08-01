//
//  SkillsView.swift
//  SurfTest
//
//  Created by juliemoorled on 01.08.2023.
//

import UIKit

final class SkillsView: UIView {

    // MARK: - Private properties

    private var skills = [String]()
    private let buttonHeight: CGFloat = 45
    private let bigPadding: CGFloat = 8
    private let smallPadding: CGFloat = 4
    private var linesCounter: Int = 1
    private var x: CGFloat = -4
    private var y: CGFloat = 0
    private let deletingImageName = "multiply"
    private let alertTitle = "Добавление навыка"
    private let alertDescription = "Введите название навыка, которым владеете"
    private let alertPlaceholder = "Название навыка"
    private let alertCancel = "Отмена"
    private let alertAdd = "Добавить"
    private let plusButtonName = "+"
    private var isEditingMode = false
    private var skillButtons = [UIButton]()
    private var plusButton = UIButton()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Actions

    @objc func skillButtonTapped(_ sender: UIButton) {
        if isEditingMode == false {
            return
        }
        if let index = skillButtons.firstIndex(of: sender) {
            skills.remove(at: index)
            skillButtons.remove(at: index)
        }
        sender.removeFromSuperview()
        updateView()
    }

    @objc func plusButtonTapped() {
        showAddSkillAlert { newSkill in
            if let skill = newSkill {
                self.skills.append(skill)
                self.updateView()
            }
        }
    }

}

extension SkillsView {

    // MARK: - Public methods

    func configure(skills: [String]) {
        self.skills = skills
        setupView()
        let combined = zip(skillButtons, skills)
        for (button, skill) in combined {
            styleButton(button: button, text: skill)
        }
        updateViewHeight()
    }

    func setMode(_ isEditingMode: Bool) {
        self.isEditingMode = isEditingMode
        if isEditingMode {
            setupEditingButtons()
            setupPlusButton()
        } else {
            setStandartButtons()
            plusButton.removeFromSuperview()
        }
    }

    // MARK: - Private methods

    private func setupView() {

        for skill in skills {
            let width = CGFloat(skill.count * 14) + bigPadding*3
            let freeWidth = CGFloat(UIScreen.main.bounds.width - x)
            if (width + bigPadding*2) > freeWidth {
                //переносим на новую строку
                x = 0
                y += (buttonHeight + smallPadding)
                linesCounter += 1
            } else {
                //оставляем на той же
            }
            let newButton = UIButton(frame: CGRect(x: x, y: y, width: width, height: buttonHeight))
            x += width + bigPadding
            skillButtons.append(newButton)
            addSubview(newButton)
            newButton.addTarget(self, action: #selector(skillButtonTapped(_:)), for: .touchUpInside)
        }

    }

    private func styleButton(button: UIButton, text: String) {
        button.setTitle(text, for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 12
    }

    private func updateViewHeight() {
        let totalHeight = (buttonHeight + smallPadding) * CGFloat(linesCounter)
        heightAnchor.constraint(equalToConstant: totalHeight).isActive = true
    }

    private func updateView() {
        for button in skillButtons {
            button.removeFromSuperview()
        }
        skillButtons.removeAll()
        linesCounter = 1
        x = -4
        y = 0
        plusButton.removeFromSuperview()
        setupView()
        let combined = zip(skillButtons, skills)
        for (button, skill) in combined {
            styleButton(button: button, text: skill)
        }
        updateViewHeight()
        setMode(isEditingMode)
    }

    private func setupEditingButtons() {

        for button in skillButtons {

            let deleteSymbol = UIImage(systemName: deletingImageName)?.withTintColor(.label)
            let symbolAttachment = NSTextAttachment()
            symbolAttachment.image = deleteSymbol
            let symbolAttributedString = NSAttributedString(attachment: symbolAttachment)
            let textAttributedString = NSAttributedString(string: button.titleLabel?.text ?? "Skill", attributes: [NSAttributedString.Key.foregroundColor: UIColor.label])
            let combinedAttributedString = NSMutableAttributedString()
            combinedAttributedString.append(textAttributedString)
            combinedAttributedString.append(NSAttributedString(string: " "))
            combinedAttributedString.append(symbolAttributedString)

            UIView.animate(withDuration: 0.2, animations: {
                button.setTitle(nil, for: .normal)
                button.setAttributedTitle(combinedAttributedString, for: .normal)
                button.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            }) { (_) in
                UIView.animate(withDuration: 0.2) {
                    button.transform = .identity
                }
            }

        }

    }

    private func setupPlusButton() {
        let width = CGFloat(buttonHeight)
        plusButton = UIButton(frame: CGRect(x: x , y: y, width: width, height: buttonHeight))
        styleButton(button: plusButton, text: plusButtonName)
        plusButton.alpha = 0
        addSubview(plusButton)
        UIView.animate(withDuration: 1, animations: {
            self.plusButton.alpha = 1
        })
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
    }

    private func setStandartButtons() {
        let combined = zip(skillButtons, skills)
        for (button, skill) in combined {
            UIView.animate(withDuration: 0.2, animations: {
                button.setAttributedTitle(nil, for: .normal)
                button.setTitle(skill, for: .normal)
                button.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            }) { (_) in
                UIView.animate(withDuration: 0.2) {
                    button.transform = .identity
                }
            }
        }
    }

    private func showAddSkillAlert(completion: @escaping (String?) -> Void) {
        let alertController = UIAlertController(title: alertTitle, message: alertDescription, preferredStyle: .alert)
            alertController.addTextField { textField in
                textField.placeholder = self.alertPlaceholder
            }
            let addAction = UIAlertAction(title: alertAdd, style: .default) { _ in
                if let skillName = alertController.textFields?.first?.text {
                    completion(skillName)
                } else {
                    completion(nil)
                }
            }
            let cancelAction = UIAlertAction(title: alertCancel, style: .cancel) { _ in
                completion(nil)
            }
            alertController.addAction(addAction)
            alertController.addAction(cancelAction)
            if let currentViewController = UIApplication.shared.keyWindow?.rootViewController {
                currentViewController.present(alertController, animated: true, completion: nil)
            }
    }

}
