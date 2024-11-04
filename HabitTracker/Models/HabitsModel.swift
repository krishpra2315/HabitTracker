//
//  HabitsModel.swift
//  HabitTracker
//
//  Created by Krish Prasad on 10/28/24.
//

import SwiftUI

struct HabitsModel: Identifiable, Equatable {
    let id: UUID = UUID()
    let name: String
    let label: String
    let color: Color
    let goal: Int
    var progress: Int
    let unit: String
    let rep: Repeat

    static func == (lhs: HabitsModel, rhs: HabitsModel) -> Bool {
        return lhs.id == rhs.id
    }
}

enum Repeat {
    case DAILY
    case WEEKDAYS
    case WEEKENDS
    case WEEKLY
    case CUSTOM
}
