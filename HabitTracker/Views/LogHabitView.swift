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
    @State var progressIncrease: Int = 0
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("\(habit.name)")
                HStack {
                    Button(action: {
                        progressIncrease = max(-habit.progress, progressIncrease - 1)
                    }) {
                        Text("-")
                            .font(.title)
                            .frame(width: 44, height: 44)
                            .foregroundColor(.white)
                            .background(Circle().fill(habit.color))
                    }

                    Text("\(habit.progress + progressIncrease)")
                        .font(.title)

                    // Custom Plus Button
                    Button(action: {
                        progressIncrease = min(habit.goal - habit.progress, progressIncrease + 1)
                    }) {
                        Text("+")
                            .font(.title)
                            .frame(width: 44, height: 44)
                            .foregroundColor(.white)
                            .background(Circle().fill(habit.color))
                    }
                }
            }
            .navigationBarItems(
                leading: 
                Button("Cancel", action: {
                    habit.progress += progressIncrease
                    showLogHabit = false
                })
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/),
                trailing:
                Button("Save", action: {
                    habit.progress += progressIncrease
                    showLogHabit = false
                })
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .bold()
            )
            .navigationTitle("Log: \(habit.name)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.light, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            
        }
        
    }
    
}


