//
//  ResultView.swift
//  TestProject
//
//  Created by Illia Verezei on 16.03.2025.
//

import SwiftUI

struct ResultView: View {
    @ObservedObject var viewModel: ResultViewModel
    
    var body: some View {
            ZStack {
                LinearGradient(colors: [.light, .lightMint], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        ExitButton(viewModel: viewModel)
                        
                        Spacer()
                        
                        Text("Result")
                            .font(.system(size: 32, weight: .semibold))
                            .foregroundStyle(.text)
                            .padding(.top, 12)
                        
                        Spacer()
                        
                        Button {} label: {
                            Circle()
                                .foregroundStyle(.clear)
                                .frame(width: 48, height: 48)
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 12)
                    }
                    Spacer()
                    
                    if let text = viewModel.petResponce.responce {
                        ResponceView(text: text)
                        ForEach(0..<8) { _ in
                            Spacer()
                        }
                        
                    } else {
                        BadResponce(viewModel: viewModel)
                        Spacer()
                    }
                    Spacer()
                }
                
                Image(viewModel.petResponce.pet == .dog ? "DogBig" : "CatBig")
                    .offset(x: 0, y: 180)
            }
        .toolbar(.hidden, for: .navigationBar)
    }
}

struct ResponceView: View {
    var text: String
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 290, height: 142)
                        .foregroundStyle(.lightPurple)
                    Text(text)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(.text)
                }
                
                Triangle()
                    .frame(width: 12, height: 170)
                    .foregroundStyle(.lightPurple)
                    .rotationEffect(Angle(degrees: 208))
                    .offset(x: 70, y: -20)
                
            }
        }
        .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 4)
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

#Preview {
    ResultView(viewModel: ResultViewModel())
}

struct BadResponce: View {
    @ObservedObject var viewModel: ResultViewModel
    
    var body: some View {
        Button {
            viewModel.close()
        } label: {
            HStack(spacing: 10) {
                Image("Repeat")
                Text("Repeat")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(.text)
            }
            .frame(width: 290, height: 54)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(.lightPurple)
            )
            .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 4)
        }
    }
}

struct ExitButton: View {
    @ObservedObject var viewModel: ResultViewModel
    
    var body: some View {
        Button {
            viewModel.close()
        } label: {
            Image("Close")
                .frame(width: 48, height: 48)
                .background(
                    Circle()
                        .foregroundStyle(.white)
                )
        }
        .padding(20)
    }
}
