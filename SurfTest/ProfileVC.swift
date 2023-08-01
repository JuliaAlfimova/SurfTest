//
//  ViewController.swift
//  SurfTest
//
//  Created by juliemoorled on 01.08.2023.
//

import UIKit

final class ProfileVC: UIViewController {

    // MARK: - Private properties

    private let navbarTitle = "Профиль"
    private let userName = "Алфимова Юлия Евгеньевна"
    private let userBio = "iOS разработчик"
    private let userLocation = "Москва"
    private let skillsTitle = "Мои навыки"
    private let skills = ["Swift", "UIKit", "ООП и SOLID", "Auto Layout", "SwiftUI", "Git", "Figma", "UX/UI", "С#", "C++"]
    private let aboutTitle = "О себе"
    private let aboutUser = "Мне 21 год. В этом году закончила МГТУ им. Н.Э. Баумана по направлению «Бизнес-информатика».\nЛюблю систему iOS за ее уникальный и красивый внешний вид и самые удобные паттерны поведения. Очень нравится идея о том, что можно создавать приложения в рамках этой системы, которыми ежедневно пользуется множество людей. А еще просто искренне люблю кодить :)\nИмею опыт разработки в учебных проектах, один из которых - приложение по поиску мероприятий PartyHub - есть в AppStore. Очень хочу продолжать расти в iOS-разработке, ищу опытную и интересную команду, в которой смогла бы полноценно развиваться и при этом действительно приносить пользу. Спасибо за уделенное время :)\nUPD Не успеваю доделать все идеально, как я хотела, ноо в какой-то момент я вообще не верила, что у меня получится, поэтому все равно рада результату. Спасибо!"
    private let userPhotoImageName = "user photo"
    private let editingImageName = "pencil"
    private let doneImageName = "checkmark.circle"

    private let bigFontSize: CGFloat = 16
    private let smallFontSize: CGFloat = 14
    private let editingButtonSize: CGFloat = 24
    private let bigPadding: CGFloat = 16
    private let smallPadding: CGFloat = 8
    private var isEditingMode = false

    private let navigationBar = UINavigationBar()
    private let scrollView = UIScrollView()
    private let infoView = InfoView()
    private let skillsTitleLabel = UILabel()
    private let editingButton = UIButton()
    private let skillView = SkillsView()
    private let aboutTitleLabel = UILabel()
    private let aboutUserLabel = UILabel()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
    }

}

extension ProfileVC: UIScrollViewDelegate {

    // MARK: - Private methods

    private func setupInterface() {
        view.backgroundColor = .systemBackground
        navigationItem.title = navbarTitle
        navigationItem.titleView?.tintColor = .systemGray6
        setupScrollView()
        setupInfoView()
        setupSkillsTitleLabel()
        setupSkillView()
        setupAboutTitleLabel()
        setupAboutUserLabel()
        setupEditingButton()
    }

    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        scrollView.delegate = self
    }

    private func setupInfoView() {
        let photo = UIImage.init(named: userPhotoImageName)
        infoView.configure(image: photo, name: userName, bio: userBio, location: userLocation)
        scrollView.addSubview(infoView)
        infoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            infoView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            infoView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }

    private func setupSkillsTitleLabel() {
        setupLabel(label: skillsTitleLabel, topAnchor: infoView.bottomAnchor)
        skillsTitleLabel.font = .systemFont(ofSize: bigFontSize, weight: .medium)
        skillsTitleLabel.text = skillsTitle
    }


    private func setupSkillView() {
        scrollView.addSubview(skillView)
        skillView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skillView.topAnchor.constraint(equalTo: skillsTitleLabel.bottomAnchor, constant: bigPadding),
            skillView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: bigPadding),
            skillView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -bigPadding)
        ])
        skillView.configure(skills: skills)
    }

    private func setupAboutTitleLabel() {
        setupLabel(label: aboutTitleLabel, topAnchor: skillView.bottomAnchor)
        aboutTitleLabel.font = .systemFont(ofSize: bigFontSize, weight: .medium)
        aboutTitleLabel.text = aboutTitle
    }

    private func setupAboutUserLabel() {
        setupLabel(label: aboutUserLabel, topAnchor: aboutTitleLabel.bottomAnchor)
        aboutUserLabel.font = .systemFont(ofSize: smallFontSize, weight: .regular)
        aboutUserLabel.numberOfLines = 0
        aboutUserLabel.text = aboutUser
        aboutUserLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }


    private func setupLabel(label: UILabel, topAnchor: NSLayoutYAxisAnchor) {
        scrollView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: bigPadding),
            label.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: bigPadding),
            label.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -bigPadding)
        ])
        label.textAlignment = .left
        label.tintColor = .label
    }

    private func setupEditingButton() {
        scrollView.addSubview(editingButton)
        editingButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editingButton.topAnchor.constraint(equalTo: skillsTitleLabel.topAnchor),
            editingButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -bigPadding),
            editingButton.widthAnchor.constraint(equalToConstant: editingButtonSize),
            editingButton.heightAnchor.constraint(equalToConstant: editingButtonSize)
        ])
        editingButton.tintColor = .label
        updateEditingButtonSymbol()
        editingButton.addTarget(self, action: #selector(editingButtonTapped), for: .touchUpInside)
    }

    private func updateEditingButtonSymbol() {
        let symbolName = isEditingMode ? doneImageName : editingImageName
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: symbolName, withConfiguration: configuration)
        editingButton.setImage(image, for: .normal)
    }

    // MARK: - Actions

    @objc private func editingButtonTapped() {
        isEditingMode.toggle()
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.updateEditingButtonSymbol()
            self.editingButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { (_) in
            UIView.animate(withDuration: 0.2) {
                self.editingButton.transform = .identity
            }
        }
        skillView.setMode(isEditingMode)

    }

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        //        print("Начало прокрутки UIScrollView")

    }

    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        //        print("scrollViewDidScrollToTop")
    }

}


