//
//  HabitsView.swift
//  HabitTracker
//
//  Created by Krish Prasad on 10/28/24.
//

import SwiftUI

struct HabitsView: View {
    @StateObject var viewModel = HabitsViewModel()
    @State var showOverlay: Bool = false
    
    var body: some View {
        VStack {
            List(viewModel.habitsList, id: \.id) { habit in
                HabitsRow(habit: habit, viewModel: viewModel)
            }
            Button("add", action: {
                showOverlay.toggle()
            })
            .sheet(isPresented: $showOverlay) {
                AddHabitView(viewModel: viewModel)

            }
            .navigationBarItems(
                trailing: Button("Add", action: {
                   showOverlay = true
                })
                .sheet(isPresented: $showOverlay) {
                    AddHabitView(viewModel: viewModel)
                }
                .foregroundColor(.blue)
                .bold()
            )
            .navigationTitle("Habits")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbarColorScheme(.light, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

struct HabitsRow: View {
    
    var habit: HabitsModel
    @State var showLogHabit: Bool = false
    var viewModel: HabitsViewModel
    
    var body: some View {
        HStack {
            Text("\(habit.name)")
            Text("\(habit.progress)")
            Text("\(habit.goal)")
            Spacer()
            Button("Log", action: {
                showLogHabit.toggle()
            })
            .sheet(isPresented: $showLogHabit) {
                LogHabitView(viewModel: viewModel)
            }
        }
    }
}



#Preview {
    HabitsView()
}

