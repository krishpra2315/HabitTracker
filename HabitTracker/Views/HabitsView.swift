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
            VStack(alignment: .leading, content: {
                HStack {
                    
                    Text("Habits")
                        .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding()
                    Spacer()
                    Button(action : {
                        showOverlay.toggle()
                    }) {
                        Image(systemName: "plus")
                            .font(.title)
                            .padding()
                    }
                    .sheet(isPresented: $showOverlay) {
                        AddHabitView(viewModel: viewModel)
                    }
                }
                Spacer()
                List($viewModel.habitsList, id: \.id) { $habit in
                    HabitsRow(habit: $habit)
                }
            })
            
            .navigationBarTitleDisplayMode(.automatic)
            .toolbarColorScheme(.light, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
    


struct HabitsRow: View {
    
    @Binding var habit: HabitsModel
    @State var showLogHabit: Bool = false
    
    var body: some View {
        HStack {
            VStack {
                Text("\(habit.name)")
                HStack {
                    Circle()
                        .fill(habit.color)
                        .frame(width: 47, height: 47)
                    Text("\(habit.progress) /")
                        .font(.largeTitle)
                    VStack {
                        Text("\(habit.goal)")
                        Text("\(habit.unit)")
                    }
                }
            }
            Spacer()
            Button("Log", action: {
                showLogHabit.toggle()
            })
        }
        .padding(25)
            .sheet(isPresented: $showLogHabit) {
                LogHabitView(habit: $habit, showLogHabit: $showLogHabit)
            }
        }
       
    }




#Preview {
    HabitsView()
}

