//
//  MainViewModel.swift
//  TestProject
//
//  Created by Illia Verezei on 15.03.2025.
//

import Foundation

final class MainViewModel: ObservableObject {
    private let recordingService: RecordingServiceProtocol?
    private let coordinator: MainCoordinatorProtocol?
    
    @Published var isRecording = false
    @Published var translationModeValue: TranslationMode = .human
    @Published var petSelection: Pet = .dog
    @Published var translationProcess = false
    
    init(recordingService: RecordingServiceProtocol? = nil, coordinator: MainCoordinatorProtocol? = nil) {
        self.recordingService = recordingService
        self.coordinator = coordinator
    }
    
    func startRecording() {
        recordingService?.startRecording(pet: petSelection)
        isRecording = true
    }
    
    func stopRecording() {
        isRecording = false
        recordingService?.stopRecording()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.translationProcess = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.coordinator?.showResult()
                self.translationProcess = false
            }
        }
    }
}
