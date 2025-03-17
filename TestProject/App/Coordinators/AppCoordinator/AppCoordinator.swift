//
//  AppCoordinator.swift
//  TestProject
//
//  Created by Illia Verezei on 17.03.2025.
//

import SwiftUI

protocol CoordinatorProtocol {
    func buildFlow() -> AnyView
}

protocol AppCoordinatorProtocol: CoordinatorProtocol {
    func selectTab(tab: Int)
}

final class AppCoordinator: AppCoordinatorProtocol, ObservableObject {
    private let mockRecordingService = MockRecordingService()
    var mainCoordinator = MainCoordinator()
    var settingsCoordinator = SettingsCoordinator()
    
    @Published var selectedTab = 0
    
    init() {
        buildMainCoordinator()
    }
    
    private func buildMainCoordinator() {
        mainCoordinator = MainCoordinator(mockRecordingService: mockRecordingService)
    }
    
    func buildFlow() -> AnyView {
        AnyView(TabViewFlow(coordinator: self))
    }
    
    func selectTab(tab: Int) {
        selectedTab = tab
    }
}
