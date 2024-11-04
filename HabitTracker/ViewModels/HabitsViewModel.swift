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
    
    func addHabit(name: String, label: String, color: Color, goal: Int, unit: String, rep: Repeat) {
        habitsList.append(HabitsModel(name: name, label: label, color: color,  goal: goal, progress: 0, unit: unit, rep: rep))
    }
    
    func removeHabit(habit: HabitsModel) {
        for i in 0...habitsList.count {
            if habitsList[i] == habit {
                
            }
        }
    }
    
    func logProgress(index: Int, amount: Int) {
        habitsList[index].progress += amount
        if (habitsList[index].progress >= habitsList[index].goal) {
            completedGoals.append(habitsList[index])
        }
    }
}
