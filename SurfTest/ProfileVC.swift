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
    private let skills = ["Swift", "UIKit", "ООП и SOLID", "Auto Layout", "MVVM", "SwiftUI", "Git", "Figma"]
    private let aboutTitle = "О себе"
    private let aboutUser = "21 год, iOS разработчик, люблю кодить"
    private let userPhotoImageName = "user photo"
    private let locationImageName = "mappin"
    private let editingImagename = "pencil"
    private let doneImagename = "checkmark.circle"

    private let navigationBar = UINavigationBar()
    private let infoView = UIView()
    private let skillsTitleLabel = UILabel()
    private let editingButton = UIButton()
    //skills
    private let aboutTitleLabel = UILabel()
    private let aboutUserLabel = UILabel()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }

    // MARK: - Actions



}

extension ProfileVC {

    // MARK: - Private methods

    private func setupInterface() {

    }

}

