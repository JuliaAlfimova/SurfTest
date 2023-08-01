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
    private let scrollView = UIScrollView()
    private let infoView = InfoView()
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
        setupAboutTitleLabel()
        setupAboutUserLabel()

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
//        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 10000)

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
        skillsTitleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        skillsTitleLabel.text = skillsTitle
    }

    private func setupAboutTitleLabel() {
        setupLabel(label: aboutTitleLabel, topAnchor: skillsTitleLabel.bottomAnchor)
        aboutTitleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        aboutTitleLabel.text = aboutTitle
    }

    private func setupAboutUserLabel() {
        setupLabel(label: aboutUserLabel, topAnchor: aboutTitleLabel.bottomAnchor)
        aboutUserLabel.font = .systemFont(ofSize: 14, weight: .regular)
        aboutUserLabel.numberOfLines = 0
        aboutUserLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?"
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

    // MARK: - Actions

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("Начало прокрутки UIScrollView")

    }

    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        print("scrollViewDidScrollToTop")
    }

}


