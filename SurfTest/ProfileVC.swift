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
    private let editingImagename = "pencil"
    private let doneImagename = "checkmark.circle"

    private let bigPadding: CGFloat = 16
    private let smallPadding: CGFloat = 8

    private let navigationBar = UINavigationBar()
    private let infoView = InfoView()
    private let scrollView = UIScrollView()
    private let skillsTitleLabel = UILabel()
    private let editingButton = UIButton()
    //skills
    private let aboutTitleLabel = UILabel()
    private let aboutUserLabel = UILabel()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
    }

    // MARK: - Actions



}

extension ProfileVC {

    // MARK: - Private methods

    private func setupInterface() {
        view.backgroundColor = .systemGray6
        navigationItem.title = navbarTitle
        setupInfoView()
        setupScrollView()
    }

    private func setupInfoView() {
        let photo = UIImage.init(named: userPhotoImageName)
        infoView.configure(image: photo, name: userName, bio: userBio, location: userLocation)
        view.addSubview(infoView)
        infoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: infoView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        scrollView.backgroundColor = .systemBackground
    }

}

