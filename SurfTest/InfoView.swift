//
//  File.swift
//  SurfTest
//
//  Created by juliemoorled on 01.08.2023.
//

import UIKit

final class InfoView: UIView {

    // MARK: - Private properties

    private let userImageViewSizeConst: CGFloat = 120
    private let bigPadding: CGFloat = 16
    private let smallPadding: CGFloat = 8
    private let locationImageName = "mappin.and.ellipse"

    private let userImageView = UIImageView()
    private let userNameLabel = UILabel()
    private let userBioLabel = UILabel()
    private let userLocationLabel = UILabel()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension InfoView {

    // MARK: - Public methods

    func configure(image: UIImage?, name: String, bio: String, location: String) {
        if let image = image {
            userImageView.image = image
        }
        userNameLabel.text = name
        userBioLabel.text = bio
        updateAttributedText(with: location, at: userLocationLabel)
    }

    // MARK: - Private methods

    private func setupView() {
        backgroundColor = .systemGray6
        setupUserImageView()
        setupUserNameLabel()
        setupUserBioLabel()
        setupUserLocationLabel()
        updateViewHeight()
    }

    private func setupUserImageView() {
        addSubview(userImageView)
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            userImageView.topAnchor.constraint(equalTo: topAnchor, constant: bigPadding),
            userImageView.widthAnchor.constraint(equalToConstant: userImageViewSizeConst),
            userImageView.heightAnchor.constraint(equalToConstant: userImageViewSizeConst)
        ])
        userImageView.backgroundColor = .systemGray
        userImageView.clipsToBounds = true
        userImageView.layer.cornerRadius = userImageViewSizeConst/2
    }

    private func setupUserNameLabel() {
        setupInfoLabel(label: userNameLabel, topAnchor: userImageView.bottomAnchor)
        userNameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        userNameLabel.textColor = .label
        userNameLabel.text = "Name"
    }

    private func setupUserBioLabel() {
        setupInfoLabel(label: userBioLabel, topAnchor: userNameLabel.bottomAnchor)
        userBioLabel.font = .systemFont(ofSize: 14)
        userBioLabel.textColor = .systemGray
        userBioLabel.text = "Bio"
    }

    private func setupUserLocationLabel() {
        setupInfoLabel(label: userLocationLabel, topAnchor: userBioLabel.bottomAnchor)

        let iconAttachment = NSTextAttachment()
        iconAttachment.image = UIImage(systemName: locationImageName)?.withTintColor(.systemGray)
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(attachment: iconAttachment))
        attributedString.append(NSAttributedString(string: " "))
        let textAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.systemGray
        ]
        let textAttributedString = NSAttributedString(string: "Location", attributes: textAttributes)
        attributedString.append(textAttributedString)
        userLocationLabel.attributedText = attributedString

    }

    private func setupInfoLabel(label: UILabel, topAnchor: NSLayoutYAxisAnchor) {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: smallPadding),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: bigPadding),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -bigPadding)
        ])
        label.textAlignment = .center
        label.numberOfLines = 0
    }

    private func updateAttributedText(with newText: String, at label: UILabel) {
        guard let attributedText = label.attributedText?.mutableCopy() as? NSMutableAttributedString else { return }
        let range = NSRange(location: 2, length: attributedText.length - 2)
        attributedText.replaceCharacters(in: range, with: newText)
        label.attributedText = attributedText
    }

    private func updateViewHeight() {
        var totalHeight: CGFloat = bigPadding + userImageViewSizeConst + smallPadding
        totalHeight += userNameLabel.intrinsicContentSize.height + smallPadding
        totalHeight += userBioLabel.intrinsicContentSize.height + smallPadding
        totalHeight += userLocationLabel.intrinsicContentSize.height + bigPadding
        self.constraints.filter { $0.firstAttribute == .height && $0.relation == .equal }.forEach { $0.constant = totalHeight }
        heightAnchor.constraint(equalToConstant: totalHeight).isActive = true
    }

}
