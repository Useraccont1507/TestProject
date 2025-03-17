//
//  Router.swift
//  TestProject
//
//  Created by Illia Verezei on 16.03.2025.
//

import SwiftUI

protocol SettingCoordinatorProtocol: CoordinatorProtocol {
    func buildFlow() -> AnyView
    func moveTo(_ row: RowType)
    func moveBack()
}

final class SettingsCoordinator: ObservableObject, SettingCoordinatorProtocol {
    @Published var path = NavigationPath()
    
    func buildFlow() -> AnyView {
        AnyView(SettingsCoordinatorFlow(coordinator: self))
    }
    
    func moveTo(_ row: RowType) {
        path.append(row)
    }

    func moveBack() {
        path.removeLast()
    }
}
