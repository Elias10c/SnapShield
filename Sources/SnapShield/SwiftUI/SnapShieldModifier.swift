//
//  SnapShieldModifier.swift
//  SnapShield
//
//  Created by Emad on 2025-10-12.
//
import SwiftUI

public extension View {
    @ViewBuilder
    func snapShield(_ shouldHide: Bool = true) -> some View {
        if shouldHide {
            SnapShieldView { self }
        } else {
            self
        }
    }
}
