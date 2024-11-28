//
//  HabitsViewModel.swift
//  HabitTracker
//
//  Created by Krish Prasad on 10/28/24.
//

import Foundation
import SwiftUI


class HabitsViewModel: ObservableObject {
    @Published var habitsList = [HabitsModel]()
    @Published var completedGoals = [HabitsModel]()
    var groupedHabits: [String: [HabitsModel]] {
        Dictionary(grouping: habitsList) { $0.rep.rawValue }
    }
    
    func addHabit(name: String, label: String, color: Color, goal: Int, unit: String, rep: Repeat) {
        habitsList.append(HabitsModel(name: name, label: label, color: color,  goal: goal, progress: 0, unit: unit, rep: rep))
        habitsList.sort {$0.name < $1.name} // alphebetic sorting
    }
    
    func removeHabit(habit: HabitsModel) {
        if let index = habitsList.firstIndex(of: habit) {
            habitsList.remove(at: index)
        }
    }
    
    func logProgress(index: Int, amount: Int) {
        habitsList[index].progress += amount
        if (habitsList[index].progress >= habitsList[index].goal) {
            completedGoals.append(habitsList[index])
        }
    }
}
