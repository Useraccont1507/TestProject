//
//  MainCoordinatorFlow.swift
//  TestProject
//
//  Created by Illia Verezei on 17.03.2025.
//

import SwiftUI

struct MainCoordinatorFlow: View {
    @ObservedObject var coordinator: MainCoordinator
    @StateObject private var mainViewModel: MainViewModel
    var recordingService: RecordingServiceProtocol?
    
    init(coordinator: MainCoordinator, mockRecordingService: RecordingServiceProtocol? = nil) {
        self.coordinator = coordinator
        self.recordingService = mockRecordingService
        let vm = MainViewModel(recordingService: recordingService, coordinator: coordinator)
        _mainViewModel = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            MainView(viewModel: mainViewModel)
                .navigationDestination(for: ViewType.self) { path in
                    switch path {
                    case .result: ResultView(viewModel: ResultViewModel(coordinator: coordinator, recordingService: recordingService))
                    }
                }
        }
    }
}

#Preview {
    MainCoordinatorFlow(coordinator: MainCoordinator())
}
