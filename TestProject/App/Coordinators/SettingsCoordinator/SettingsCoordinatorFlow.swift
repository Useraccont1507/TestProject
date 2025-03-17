//
//  SettingsRouterFlow.swift
//  TestProject
//
//  Created by Illia Verezei on 16.03.2025.
//

import SwiftUI

struct SettingsCoordinatorFlow: View {
    @ObservedObject var coordinator: SettingsCoordinator
    
    var body: some View {
        NavigationStack(path:$coordinator.path) {
            SettingsView(viewModel: SettingsViewModel(coordinator: coordinator))
                .navigationDestination(for: RowType.self) { path in
                    switch path {
                    case .rateUs(_): EmptyView()
                    case .shareApp(_): EmptyView()
                    case .contactUs(_): EmptyView()
                    case .restorePurchases(_): EmptyView()
                    case .privacyPolicy(_): EmptyView()
                    case .termsOfUse(_): EmptyView()
                    }
                }
        }
    }
}

#Preview {
    SettingsCoordinatorFlow(coordinator: SettingsCoordinator())
}
