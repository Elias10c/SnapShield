//
//  SnapShieldView.swift
//  SnapShield
//
//  Created by Emad on 2025-10-12.
//

import SwiftUI
import UIKit

public struct SnapShieldView<Content: View>: UIViewRepresentable {
    
    private let content: () -> Content
    private let hostingController: UIHostingController<Content>
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.hostingController = UIHostingController(rootView: content())
    }
    
    public func makeUIView(context: Context) -> UIView {
        let secureTextField = UITextField()
        secureTextField.isSecureTextEntry = true
        secureTextField.isUserInteractionEnabled = false
        
        guard let secureView = secureTextField.subviews.first else {
            return UIView()
        }
        
        secureView.removeFromSuperview()
        secureView.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
        
        secureView.addSubview(hostingController.view)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: secureView.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: secureView.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: secureView.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: secureView.trailingAnchor)
        ])
        
        return secureView
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) { }
    
    public func sizeThatFits(_ proposal: ProposedViewSize, uiView: UIView, context: Context) -> CGSize? {
        let targetSize = CGSize(
            width: proposal.width ?? .infinity,
            height: proposal.height ?? .infinity
        )
        return hostingController.sizeThatFits(in: targetSize)
    }
}
