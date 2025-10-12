//
//  SecureView.swift
//  SnapShield
//
//  Created by Emad on 2025-10-12.
//

import Foundation
import UIKit

// Internal to the package (not public)
final class SecureView: UIView {

    fileprivate var secureField: UITextField = UITextField()

    // toggle this value to enable or disable
    // the secure behaviour
    var isSecure: Bool = true {
        didSet {
            secureField.isSecureTextEntry = isSecure
        }
    }

    // placeholder will become visible when user try to capture screenshot
    // or try to record the screen
    private(set) var placeholderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // add your content in this view
    // it will be secure
    private(set) var contentView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func setupView() {
        contentView = secureField.subviews.first ?? UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.removeFromSuperview()

        isSecure = true

        addSubview(placeholderView)
        addSubview(contentView)

        NSLayoutConstraint.activate([
            placeholderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            placeholderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            placeholderView.topAnchor.constraint(equalTo: topAnchor),
            placeholderView.bottomAnchor.constraint(equalTo: bottomAnchor),

            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
