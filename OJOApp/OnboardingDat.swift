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
        OnboardingData(id: 0, objectImage: "onboarding-object-1", primaryText: "يشعر اوجو بالسعادة عند سماع الكلمات الجيدة ", secondaryText: ", ولكنه يحزن على سماع الكلمات المؤذية."),
        OnboardingData(id: 1,  objectImage: "onboarding-object-2", primaryText: "قم بالضغط على الزر في الاعلى ", secondaryText: " للتنشيط وايقاف الصوت."),
        OnboardingData(id: 2, objectImage: "onboarding-object-3", primaryText: "اضغط على الزر مرة أخرى ", secondaryText: "لتغيير حالة اوجو العاطفية.")
    ]
}
