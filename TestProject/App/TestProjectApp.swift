//
//  TestProjectApp.swift
//  TestProject
//
//  Created by Illia Verezei on 15.03.2025.
//

import SwiftUI

@main
struct TestProjectApp: App {
    let appCoordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            appCoordinator.buildFlow()
        }
    }
}
