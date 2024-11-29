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

        TabView {
            NavigationStack {
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
//                    List($viewModel.habitsList, id: \.id) { $habit in
//                        HabitsRow(habit: $habit)
//                    }
//                  habits list adder, new grouping method
                    List {
                        ForEach(viewModel.groupedHabits.keys.sorted(), id: \.self) { group in
                            // grab array from the dict, each array contains a group
                            if let habits = viewModel.groupedHabits[group], !habits.isEmpty {
                                Section(header: Text(group)) {
                                    ForEach(habits, id: \.id) { habit in
                                        // new habitrow
                                        HabitsRow(habit: .constant(habit))
                                    }
                                }
                            }
                        }
                    }
                    
                })
                .navigationBarTitleDisplayMode(.automatic)
                .toolbarColorScheme(.light, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                    
            }
            .tabItem {
                Label("Habits", systemImage: "house.fill")
            }
            
            NavigationStack {
                Text("Progress")
            }
            .tabItem {
                Label("Progress", systemImage: "calendar")
            }
        }
        }
    }
    


struct HabitsRow: View {
    
    @Binding var habit: HabitsModel
    @State var showLogHabit: Bool = false
    
    var body: some View {
//        HStack {
//        VStack {
        HStack(spacing: 8) {
            ZStack {
                Circle()
                    .fill(habit.color)
                    .frame(width: 47, height: 47)
                    .offset(x: -22)
                
                Text("\(habit.label)")
                    .font(.system(size: 15))
                    .offset(x: -22)
            }
            .padding(.leading, 3)

            ZStack {
                
                Text("0")
                    .font(.system(size: 40))
                    .offset(x: -21, y: 16)

                Text(" /")
                    .font(.system(size: 34))
                    .offset(x: -5, y: 14)

                Text("\(habit.goal)")
                    .font(.system(size: 14))
                    .offset(x: 15, y: 10)

                Text("\(habit.unit)")
                    .font(.system(size: 14))
                    .offset(x: 18, y: 26)
            }

            Text("\(habit.name)")
                .font(.system(size: 15))
                .offset(x: -50, y: -20)
            Spacer()
            Button(action: {
                showLogHabit.toggle()
            }) {
                ZStack{
                    Image(systemName: "capsule.fill")
                        .resizable()
                        .frame(width: 70, height: 30)
                        .foregroundColor(.blue)
                    
                    Text("+ Log")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
        }
        .padding()
        .sheet(isPresented: $showLogHabit) { LogHabitView(habit: $habit, showLogHabit: $showLogHabit)
        }
    }
    
    
    
    
    #Preview {
        HabitsView()
    }
    
}
