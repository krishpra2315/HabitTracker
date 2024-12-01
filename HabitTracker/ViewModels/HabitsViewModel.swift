//
//  HabitsViewModel.swift
//  HabitTracker
//
//  Created by Krish Prasad on 10/28/24.
//

import SwiftUI


class HabitsViewModel: ObservableObject {
    @Published var habitsList = [HabitsModel]()
    @Published var completedGoals = ["DAILY": 0, "WEEKDAYS": 0, "WEEKENDS": 0, "WEEKLY": 0, "CUSTOM": 0]
    
    var groupedHabits: [String: [HabitsModel]] {
        Dictionary(grouping: habitsList) { $0.rep.rawValue }
    }
    
    func addHabit(name: String, label: String, color: Color, goal: Int, unit: String, rep: Repeat) {
        habitsList.append(HabitsModel(name: name, label: label, color: color,  goal: goal, progress: 0, unit: unit, rep: rep))
        habitsList.sort {$0.name < $1.name} // alphebetic sorting
    }
    
    func removeHabit(habit: HabitsModel) {
        if let index = habitsList.firstIndex(of: habit) {
            if (habit.progress == habit.goal) {
                completedGoals["\(habit.rep.rawValue.uppercased())"]! -= 1
            }
            habitsList.remove(at: index)
        }
    }
}
