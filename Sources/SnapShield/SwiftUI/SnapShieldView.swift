//
//  SnapShieldView.swift
//  SnapShield
//
//  Created by Emad on 2025-10-12.
//

import SwiftUI
import UIKit

struct SnapShieldView<Content: View, Placeholder: View>: UIViewRepresentable {
    
    private let content: () -> Content
    private let placeholder: (() -> Placeholder)?
    private let hostingController: UIHostingController<Content>
    private let placeholderHostingController: UIHostingController<Placeholder>?
    
    // Initializer with custom placeholder
    init(
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder placeholder: @escaping () -> Placeholder
    ) {
        self.content = content
        self.placeholder = placeholder
        self.hostingController = UIHostingController(rootView: content())
        self.placeholderHostingController = UIHostingController(rootView: placeholder())
    }
    
    func makeUIView(context: Context) -> UIView {
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
        
        // Add content view to secure view
        secureView.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: secureView.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: secureView.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: secureView.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: secureView.trailingAnchor)
        ])
        
        // If there's a placeholder, create container with both views
        if let placeholderController = placeholderHostingController {
            let containerView = UIView()
            containerView.addSubview(placeholderController.view)
            containerView.addSubview(secureView)
            
            placeholderController.view.translatesAutoresizingMaskIntoConstraints = false
            secureView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                // Placeholder constraints
                placeholderController.view.topAnchor.constraint(equalTo: containerView.topAnchor),
                placeholderController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
                placeholderController.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                placeholderController.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                
                // Secure view constraints
                secureView.topAnchor.constraint(equalTo: containerView.topAnchor),
                secureView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
                secureView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                secureView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
            ])
            
            return containerView
        }
        
        // No placeholder, return secure view directly
        return secureView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        hostingController.rootView = content()
        placeholderHostingController?.rootView = placeholder?() ?? placeholder!()
    }
    
    func sizeThatFits(_ proposal: ProposedViewSize, uiView: UIView, context: Context) -> CGSize? {
        let targetSize = CGSize(
            width: proposal.width ?? .infinity,
            height: proposal.height ?? .infinity
        )
        return hostingController.sizeThatFits(in: targetSize)
    }
}

// Initializer without placeholder (hides content on screenshot)
extension SnapShieldView where Placeholder == EmptyView {
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.placeholder = nil
        self.hostingController = UIHostingController(rootView: content())
        self.placeholderHostingController = nil
    }
}
