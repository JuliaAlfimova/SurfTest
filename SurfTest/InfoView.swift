//
//  File.swift
//  SurfTest
//
//  Created by juliemoorled on 01.08.2023.
//

import UIKit

final class InfoView: UIView {

    // MARK: - Private properties

    private let userImageView = UIImageView()
    private let userNameLabel = UILabel()
    private let userBioLabel = UILabel()
    private let userLocationLabel = UILabel()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension InfoView {

    // MARK: - Private methods

    private func setupView() {
        view?.backgroundColor = .systemGray5
        setupUserImageView()
        setupUserNameLabel ()

    }

    private func setupUserImageView() {

    }

    private func setupUserNameLabel () {

    }

}
