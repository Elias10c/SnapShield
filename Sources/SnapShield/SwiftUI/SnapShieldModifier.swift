//
//  SnapShieldModifier.swift
//  SnapShield
//
//  Created by Emad on 2025-10-12.
//
import SwiftUI

public extension View {
    /// Hides the content when screenshot is taken
    @ViewBuilder
    func snapShield(_ shouldHide: Bool = true) -> some View {
        if shouldHide {
            SnapShieldView { self }
        } else {
            self
        }
    }
    
    /// Shows a custom placeholder view when screenshot is taken
    @ViewBuilder
    func snapShield<V: View>(@ViewBuilder _ placeholder: @escaping () -> V) -> some View {
        SnapShieldView(content: { self }, placeholder: placeholder)
    }
}
