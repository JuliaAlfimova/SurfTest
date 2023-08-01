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
    private var skillButtons = [UIButton]()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    func configure(skills: [String]) {
        self.skills = skills
        setupView()
    }

    // MARK: - Private methods

    private func setupView() {

        var x: CGFloat = -smallPadding
        var y: CGFloat = 0

        for skill in skills {
            let width = CGFloat(skill.count * 14) + bigPadding
            let freeWidth = CGFloat(UIScreen.main.bounds.width - x)
            if (width + bigPadding*2) > freeWidth {
                //переносим на новую строку
                x = 0
                y += (buttonHeight + smallPadding)
                linesCounter += 1
            } else {
                //оставляем на той же
                x += smallPadding
            }
            let newButton = UIButton(frame: CGRect(x: x, y: y, width: width, height: buttonHeight))
            x += width

            newButton.setTitle(skill, for: .normal)
            newButton.setTitleColor(.label, for: .normal)
            newButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            newButton.backgroundColor = .systemGray6
            newButton.layer.cornerRadius = 12

            addSubview(newButton)
            skillButtons.append(newButton)
        }

        updateViewHeight()

    }

    private func updateViewHeight() {
        let totalHeight = (buttonHeight + smallPadding) * CGFloat(linesCounter)
        heightAnchor.constraint(equalToConstant: totalHeight).isActive = true
    }

}
