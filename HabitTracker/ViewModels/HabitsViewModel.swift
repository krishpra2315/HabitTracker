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
    
    func addHabit() {
        habitsList.append(HabitsModel(name: "Habit1", label: "f", color: Color.red, goal: 10, unit: "hr", rep: Repeat.WEEKLY))
    }
    
    func logProgress(index: Int, amount: Int) {
        habitsList[index].progress += amount
        if (habitsList[index].progress >= habitsList[index].goal) {
            completedGoals.append(habitsList[index])
        }
    }
}
