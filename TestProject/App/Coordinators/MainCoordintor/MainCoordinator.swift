//
//  MainRouter.swift
//  TestProject
//
//  Created by Illia Verezei on 16.03.2025.
//

import SwiftUI

protocol MainCoordinatorProtocol: CoordinatorProtocol {
    func showResult()
    func moveBack()
}

enum ViewType: Hashable {
    case result
}

final class MainCoordinator: ObservableObject, MainCoordinatorProtocol {
    private var mockRecordingService: MockRecordingService?
    
    @Published var path = NavigationPath()
    
    init(mockRecordingService: MockRecordingService? = nil) {
        self.mockRecordingService = mockRecordingService
    }
    
    func buildFlow() -> AnyView {
        return AnyView(MainCoordinatorFlow(coordinator: self, mockRecordingService: mockRecordingService))
    }
    
    func showResult() {
        path.append(ViewType.result)
    }
    
    func moveBack() {
        path.removeLast()
    }
}
