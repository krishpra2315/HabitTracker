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
    @StateObject var viewModel: HabitsViewModel
    @State var progressIncrease: Int = 0
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Text(habit.name)
                    .font(.title)
                    .padding(.bottom, 5)
                    .multilineTextAlignment(.center)
                                
                HStack(spacing: 30) {
                    // Minus Button
                    Button(action: {
                        progressIncrease = max(-habit.progress, progressIncrease - 1)
                    }) {
                        Text("-")
                            .font(.largeTitle)
                            .frame(width: 70, height: 70)
                            .foregroundColor(.white)
                            .background(Circle().fill(habit.color))
                    }

                    // Input Field for Progress
                    TextField("0", value: $progressIncrease, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .frame(width: 100, height: 70)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(12)

                    // Plus Button
                    Button(action: {
                        progressIncrease = min(habit.goal - habit.progress, progressIncrease + 1)
                    }) {
                        Text("+")
                            .font(.largeTitle)
                            .frame(width: 70, height: 70)
                            .foregroundColor(.white)
                            .background(Circle().fill(habit.color))
                    }
                }
                
                Text("\(habit.progress) / \(habit.goal) \(habit.unit)")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Spacer()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(UIColor.systemBackground))
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            )
            .navigationBarItems(
                leading: 
                Button("Cancel", action: {
                    progressIncrease = 0
                    showLogHabit = false
                })
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/),
                trailing:
                Button("Save", action: {
                    habit.progress += progressIncrease
                    if (habit.progress >= habit.goal) {
                        viewModel.completedGoals["\(habit.rep.rawValue.uppercased())"]! += 1
                    }
                    progressIncrease = 0
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

#Preview {
    HabitsView()
}


