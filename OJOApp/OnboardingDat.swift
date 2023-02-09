//
//  OnboardingDat.swift
//  OJOApp
//
//  Created by ARWA ALSALEM on 18/07/1444 AH.
//

import Foundation
struct OnboardingData: Hashable, Identifiable {
    let id: Int
    let objectImage: String
    let primaryText: String
    let secondaryText: String

    static let list: [OnboardingData] = [
        OnboardingData(id: 0, objectImage: "onboarding-object-1", primaryText: "OJO feels alive hearing good words ", secondaryText: ", but grieves hearing hurtful ones."),
        OnboardingData(id: 1,  objectImage: "onboarding-object-2", primaryText: "Press OJO to Activate and Stop ", secondaryText: "Voice Detection."),
        OnboardingData(id: 2, objectImage: "onboarding-object-3", primaryText: "Press OJO Again to Change his ", secondaryText: "Emotional Status.")
    ]
}
