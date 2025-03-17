//
//  RecordingService.swift
//  TestProject
//
//  Created by Illia Verezei on 16.03.2025.
//

import AVFoundation

protocol RecordingServiceProtocol {
    func startRecording(pet: Pet)
    func stopRecording()
    func getResult() -> ResultMessage?
}

//Mock implementation

final class MockRecordingService: RecordingServiceProtocol {
    var result: ResultMessage?
    
    func startRecording(pet: Pet) {
        var responce = ""
        switch pet {
        case .cat:
            responce = "I’m hungry, feed me!"
        case .dog:
            responce = "What are you doing, human?"
        }
        result = ResultMessage(pet: pet, responce: responce)
    }
    
    func stopRecording() {
        //mock
    }
    
    func getResult() -> ResultMessage? {
        result
    }
}
