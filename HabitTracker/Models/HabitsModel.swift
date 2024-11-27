//
//  HabitsModel.swift
//  HabitTracker
//
//  Created by Krish Prasad on 10/28/24.
//

import SwiftUI

class HabitsModel: Identifiable, Equatable, ObservableObject {
    let id: UUID = UUID()
    @Published var name: String
    @Published var label: String
    @Published var color: Color
    @Published var goal: Int
    @Published var progress: Int
    @Published var unit: String
    @Published var rep: Repeat
    
    init(name: String, label: String, color: Color, goal: Int, progress: Int, unit: String, rep: Repeat) {
            self.name = name
            self.label = label
            self.color = color
            self.goal = goal
            self.progress = progress
            self.unit = unit
            self.rep = rep
    }

    static func == (lhs: HabitsModel, rhs: HabitsModel) -> Bool {
        return lhs.id == rhs.id
    }
}

enum Repeat: String {
    case DAILY = "Daily"
    case WEEKDAYS = "Weekdays"
    case WEEKENDS = "Weekends"
    case WEEKLY = "Weekly"
    case CUSTOM = "Custom"
    case MONDAY = "Every Monday"
    case TUESDAY = "Every Tuesday"
    case WEDNESDAY = "Every Wednesday"
    case THURSDAY = "Every Thursday"
    case FRIDAY = "Every Friday"
    case SATURDAY = "Every Saturday"
    case SUNDAY = "Every Sunday"
}
