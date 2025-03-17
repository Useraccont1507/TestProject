//
//  ResultViewModel.swift
//  TestProject
//
//  Created by Illia Verezei on 16.03.2025.
//

import Foundation


final class ResultViewModel: ObservableObject {
    let coordinator: MainCoordinatorProtocol?
    let recordingService: RecordingServiceProtocol?
    
    @Published var petResponce = ResultMessage(pet: .cat, responce: nil)
    
    init(coordinator: MainCoordinatorProtocol? = nil, recordingService: RecordingServiceProtocol? = nil) {
        self.coordinator = coordinator
        self.recordingService = recordingService
        guard let result = recordingService?.getResult() else { return }
        petResponce = result
    }
    
    func close() {
        coordinator?.moveBack()
    }
}
