//
//  HabitsModel.swift
//  HabitTracker
//
//  Created by Krish Prasad on 10/28/24.
//

import SwiftUI

struct HabitsModel: Identifiable {
    let id: UUID = UUID()
    let name: String
    let label: String
    let color: Color
    let goal: Int
    var progress = 0
    let unit: String
    let rep: Repeat
    
}

enum Repeat {
    case DAILY
    case WEEKDAYS
    case WEEKENDS
    case WEEKLY
    case CUSTOM
}
