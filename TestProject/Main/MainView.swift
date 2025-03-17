//
//  ContentView.swift
//  TestProject
//
//  Created by Illia Verezei on 15.03.2025.
//

import SwiftUI
import Kingfisher

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.light, .lightMint], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                if !viewModel.translationProcess {
                    Text("Translator")
                        .font(.system(size: 32, weight: .semibold))
                        .foregroundStyle(.text)
                        .padding(.top, 12)
                    
                    HumanPetSelector(value: $viewModel.translationModeValue)
                    
                    HStack(spacing: 35) {
                        StartSpeakButton(viewModel: viewModel)
                        PetPickButtons(petSelection: $viewModel.petSelection)
                    }
                    .padding(.top, 60)
                    
                    Spacer()
                    
                } else {
                    Spacer()
                    
                    Text("Process of translation...")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.text)
                    
                    Spacer()
                }
            }
            
            Image(viewModel.petSelection == .dog ? "DogBig" : "CatBig")
                .offset(x: 0, y: 180)
        }
    }
}

#Preview {
    MainView(viewModel: MainViewModel())
}

struct StartSpeakButton: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 178, height: 176)
                .foregroundStyle(.white)
                .shadow(color: .grayShadow, radius: 8, x: 0, y: 4)
            VStack {
                if !viewModel.isRecording {
                    Image("Microphone")
                        .padding(.top, 44)
                        .padding(.bottom)
                    
                    Spacer()
                    
                    Text("Start speak")
                        .foregroundStyle(.text)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.bottom, 16)
                } else {
                    
                    if let url = URL(string: "https://s3-alpha-sig.figma.com/img/9297/5f1e/a03badf80a1bd6a597390f7e212c7028?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=FEP9VrmLuR6ej7NoaISTkv~b3BysteY3gr6ICxEzrhlbWMCbIFLylBOVsl6-skFKzSIFQqTGF12giAbAB0stuTOFClUQ3wb-oMx0i9bsovarZ3~i7Ki8ovNO-8u42al5tN2gynCEyWKxBX0ozMV6zxw5dawxwKFlEBe527jYY2wjFcSK3Eg87xpu2z66hH2Emi7nLantdmZBE5PcZEQUuV0IARrsqDbNDK-TDsM5Ws7af1Zo0tKTfAR2v8RFH6ARuhS95rs8b~suD7CWjk~2aqBVBO8qRGoOlsMZv50g5ELnqE8VfUNpXbdo1Ls9~bNcdyy3nNtiA8NtidUpK~TElQ__") {
                        KFAnimatedImage(url)
                            .scaledToFit()
                            .frame(width: 163, height: 95)
                            .padding(.top, 19)
                    }
                    
                    Spacer()
                    
                    Text("Recording...")
                        .foregroundStyle(.text)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.bottom, 16)
                }
            }
        }
        .frame(width: 178, height: 176)
        .contentShape(Rectangle())
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged({ _ in
                    viewModel.startRecording()
                })
                .onEnded({ _ in
                    viewModel.stopRecording()
                })
        )
    }
}

struct PetPickButtons: View {
    @Binding var petSelection: Pet
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 107, height: 176)
                .foregroundStyle(.white)
                .shadow(color: .grayShadow, radius: 8, x: 0, y: 4)
            
            VStack(spacing: 12) {
                Button {
                    petSelection = .cat
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 70, height: 70)
                            .foregroundStyle(.lightBlue)
                        Image("Cat")
                            .padding(.leading, 12)
                            .padding(.trailing, 12)
                    }
                    .overlay(content: {
                        if  petSelection == .dog {
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(.white.opacity(0.3))
                        }
                    })
                }
                Button {
                    petSelection = .dog
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 70, height: 70)
                            .foregroundStyle(.yellowGreen)
                        Image("Dog")
                    }
                    .overlay(content: {
                        if  petSelection == .cat {
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(.white.opacity(0.3))
                        }
                    })
                    .padding(.leading, 12)
                    .padding(.trailing, 12)
                }
            }
        }
    }
}

struct HumanPetSelector: View {
    @Binding var value: TranslationMode
    
    var body: some View {
        HStack(spacing: 8) {
            Button {
                print("human")
            } label: {
                Text("human".uppercased())
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.text)
            }
            .frame(width: 135, height: 61)
            
            Image("Arrow")
            
            Button {
                print("pet")
            } label: {
                Text("pet".uppercased())
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.text)
            }
            .frame(width: 135, height: 61)
        }
        .frame(maxWidth: .infinity)
    }
}
