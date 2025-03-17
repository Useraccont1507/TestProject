//
//  TabViewFlow.swift
//  TestProject
//
//  Created by Illia Verezei on 16.03.2025.
//

import SwiftUI

enum Tab: Int, CaseIterable {
    case translator = 0
    case settings
    
    var title: String {
        switch self {
        case .translator:
            return "Translator"
        case .settings:
            return "Settings"
        }
    }
    
    var iconName: String{
        switch self {
        case .translator:
            return "message"
        case .settings:
            return "gearshape"
        }
    }
}

struct TabViewFlow: View {
    @ObservedObject var coordinator: AppCoordinator
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.light, .lightMint], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                TabView(selection: $coordinator.selectedTab) {
                    coordinator.mainCoordinator.buildFlow()
                        .tag(0)
                    coordinator.settingsCoordinator.buildFlow()
                        .tag(1)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                
                HStack(spacing: 42) {
                    ForEach((Tab.allCases), id: \.self){ item in
                        Button{
                            coordinator.selectTab(tab: item.rawValue)
                        } label: {
                            CustomTabItem(imageName: item.iconName, title: item.title, isActive: (coordinator.selectedTab == item.rawValue))
                        }
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 216, height: 82)
                        .foregroundStyle(.white)
                        .shadow(color: .darkBlue, radius: 8, x: 0, y: 0)
                )
                .padding(.bottom, 16)
            }
        }
    }
}

struct CustomTabItem: View {
    var imageName: String
    var title: String
    var isActive: Bool
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(isActive ? .text : .lightText)
            Text(title)
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(isActive ? .text : .lightText)
        }
    }
}

#Preview {
    TabViewFlow(coordinator: AppCoordinator())
}
