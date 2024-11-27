//
//  LogHabitView.swift
//  HabitTracker
//
//  Created by Vedant Bhatt on 11/27/24.
//

import SwiftUI

struct LogHabitView: View {
    @Binding var habit: HabitsModel
    @Binding var showLogHabit: Bool
    
    var body: some View {
        VStack {
            Text("\(habit.name)")
            Stepper("\(habit.progress)", value: $habit.progress, in: 1...habit.goal)
        }
        .navigationTitle("Log")
        Button("Save", action: {
            showLogHabit = false
        })
    }
    
}


