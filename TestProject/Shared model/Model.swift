//
//  Model.swift
//  TestProject
//
//  Created by Illia Verezei on 17.03.2025.
//

import Foundation

enum TranslationMode {
    case pet
    case human
}

enum Pet {
    case dog
    case cat
}

struct ResultMessage {
    let pet: Pet
    var responce: String?
}

enum RowType: Identifiable, Hashable {
    var id: UUID {
        UUID()
    }
    
    case rateUs(String)
    case shareApp(String)
    case contactUs(String)
    case restorePurchases(String)
    case termsOfUse(String)
    case privacyPolicy(String)
}
