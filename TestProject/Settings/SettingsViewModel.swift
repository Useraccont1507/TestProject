//
//  SettingsViewModel.swift
//  TestProject
//
//  Created by Illia Verezei on 16.03.2025.
//

import SwiftUI

final class SettingsViewModel: ObservableObject {
    @ObservedObject var coordinator: SettingsCoordinator
    
    init(coordinator: SettingsCoordinator) {
        self.coordinator = coordinator
    }
    
    let rows: [RowType] = [
        .rateUs("Rate Us"),
        .shareApp("Share App"),
        .contactUs("Contact Us"),
        .restorePurchases("Restore Purchases"),
        .privacyPolicy("Privacy Policy"),
        .termsOfUse("Terms of Use")
    ]
    
    func goToView(_ row: RowType) {
        coordinator.moveTo(row)
    }
}
