//
//  HabitsView.swift
//  HabitTracker
//
//  Created by Krish Prasad on 10/28/24.
//

import SwiftUI

struct HabitsView: View {
    @StateObject var viewModel = HabitsViewModel()
    
    var body: some View {
        VStack {
            List(viewModel.habitsList, id: \.id, rowContent: { habit in
                HStack {
                    Text(habit.name)
                    Text("\(habit.progress)")
                }
            })
            Button("add", action: {
                viewModel.addHabit()
            })
            Button("edit", action: {
                viewModel.editHabit()
            })
        }
        .padding()
    }
}

#Preview {
    HabitsView()
}
