//
//  SettingsView.swift
//  TestProject
//
//  Created by Illia Verezei on 16.03.2025.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.light, .lightMint], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text("Settings")
                    .font(.system(size: 32, weight: .semibold))
                    .foregroundStyle(.text)
                    .padding(.top, 12)
                
                List(viewModel.rows, id: \.id) { row in
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 358, height: 50)
                            .foregroundStyle(.lightPurple)
                        HStack {
                            Text(rowTitle(row))
                                .font(.system(size: 16, weight: .semibold))
                                .padding(.leading, 16)
                            Spacer()
                            Image("ArrowRight")
                                .padding(.trailing, 16)
                        }
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    .onTapGesture {
                        viewModel.goToView(row)
                    }
                }
                .listStyle(.plain)
            }
        }
    }
    
    func rowTitle(_ row: RowType) -> String {
        switch row {
        case .rateUs(let value): return value
        case .shareApp(let value): return value
        case .contactUs(let value): return value
        case .restorePurchases(let value): return value
        case .privacyPolicy(let value): return value
        case .termsOfUse(let value): return value
        }
    }
}

#Preview {
    SettingsView(viewModel: SettingsViewModel(coordinator: SettingsCoordinator()))
}
