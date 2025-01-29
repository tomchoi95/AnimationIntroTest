//
//  Item.swift
//  AnimationIntroTest
//
//  Created by 최범수 on 2025-01-29.
//

import Foundation
import SwiftUICore

struct Item: Identifiable {
    var id: String = UUID().uuidString
    var image: String
    var title: String
    
    var scale: CGFloat = 1
    var anchor: UnitPoint = .center
    var offset: CGFloat = 0
    var rotation: CGFloat = 0
    var zIndex: CGFloat = 0
}

let items: [Item] = [
    .init(image: "figure.walk.circle.fill", title: "Keep an eye on your workout.", scale: 1),
    .init(image: "figure.run.circle.fill", title: "Maintain your cardio fitness", scale: 0.6, anchor: .topLeading, offset: -70, rotation: 30),
    .init(image: "figure.badminton.circle.fill", title: "Take a break from work and relax", scale: 0.5, anchor: .bottomLeading, offset: -60, rotation: 35),
    .init(image: "figure.climbing.circle.fill", title: "Turn climbing into a hobby", scale: 0.4, anchor: .bottomLeading, offset: -50, rotation: 160),
    .init(image: "figure.cooldown.circle.fill", title: "Cool down after a workout", scale: 0.4, anchor: .bottomLeading, offset: -50, rotation: 2500),
]
