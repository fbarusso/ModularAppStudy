//
//  CustomAlert.swift
//
//
//  Created by MB Labs on 15/02/24.
//

import UIKit

class CustomAlert {
    // MARK: - Configuration

    private enum Configuration {
        static let initialAlpha = 0.0
        static let backgroundViewTargetAlpha = 0.6
        static let animationDuration = 0.3
        static let alertWidthRatio = 0.7
    }

    // MARK: - Components

    private let backgroundView: UIView = {
        let view = UIView()

        view.backgroundColor = UIColor(customColor: .themeDark)
        view.alpha = Configuration.initialAlpha

        return view
    }()

    private let alertView: UIView = {
        let view = UIView()

        view.backgroundColor = .white
        view.layer.cornerRadius = CornerRadius.medium

        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()

        label.font = .systemFont(ofSize: FontSize.medium, weight: .bold)
        label.textColor = UIColor(customColor: .themeDark)

        return label
    }()

    private let messageLabel: UILabel = {
        let label = UILabel()

        label.font = .systemFont(ofSize: FontSize.small)
        label.textColor = UIColor(customColor: .themeDark)
        label.numberOfLines = 0

        return label
    }()

    private lazy var dismissButton: CustomButton = {
        let customButton = CustomButton(title: "Ok", backgroundColor: UIColor(customColor: .accentCyan))

        customButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)

        return customButton
    }()

    // MARK: - Helpers

    func showAlert(title: String, message: String, on viewController: UIViewController) {
        guard let view = viewController.view else { return }
        view.addSubview(backgroundView)
        backgroundView.fillSuperview()

        UIView.animate(withDuration: Configuration.animationDuration) {
            self.backgroundView.alpha = Configuration.backgroundViewTargetAlpha
        } completion: { done in
            if done {
                self.setupAlertView(title: title, message: message, on: view)
            }
        }
    }

    private func setupAlertView(title: String, message: String, on view: UIView) {
        view.addSubview(alertView)
        alertView.center(inView: backgroundView)
        alertView.setWidth(view.frame.width * Configuration.alertWidthRatio)

        alertView.addSubview(titleLabel)
        titleLabel.centerX(inView: alertView, topAnchor: alertView.topAnchor, paddingTop: VerticalPadding.medium)
        titleLabel.text = title

        alertView.addSubview(messageLabel)
        messageLabel.anchor(top: titleLabel.bottomAnchor, left: alertView.leftAnchor, right: alertView.rightAnchor, paddingTop: VerticalPadding.medium, paddingLeft: HorizontalPadding.small, paddingRight: HorizontalPadding.small)
        messageLabel.text = message

        alertView.addSubview(dismissButton)
        dismissButton.anchor(top: messageLabel.bottomAnchor, left: alertView.leftAnchor, bottom: alertView.bottomAnchor, right: alertView.rightAnchor, paddingTop: VerticalPadding.medium, paddingLeft: HorizontalPadding.small, paddingBottom: VerticalPadding.medium, paddingRight: HorizontalPadding.small)
    }

    // MARK: - Actions

    @objc func dismissAlert() {
        UIView.animate(withDuration: Configuration.animationDuration) {
            self.backgroundView.alpha = Configuration.initialAlpha
        } completion: { done in
            if done {
                self.alertView.removeFromSuperview()
                self.backgroundView.removeFromSuperview()
            }
        }
    }
}
