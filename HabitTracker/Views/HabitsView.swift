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
                .navigationBarItems(
                    trailing: 
                    Button(action : {
                        showOverlay.toggle()
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 25))
                            .foregroundColor(.blue)
                    }
                    .sheet(isPresented: $showOverlay) {
                        AddHabitView(viewModel: viewModel)
                })
                .navigationTitle("Habits")
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
                    .offset(x: -22)
            }
            .padding(.leading, 3)

            HStack(spacing: -25) {
                Text("\(habit.progress)")
                    .font(.system(size: 40, design: .monospaced))
                    .offset(x: -21, y: 16)
                    .padding(.trailing, 4)

                Text("/")
                    .font(.system(size: 34, design: .monospaced))
                    .offset(x: 0, y: 16)
                VStack(alignment: .leading) {
                    Text("\(habit.goal)")
                        .font(.system(size: 13, design: .monospaced))
                        .bold()
                    
                    Text("\(habit.unit)")
                        .font(.system(size: 13, design: .monospaced))
                        .bold()
                }
                .offset(x: 23, y: 16)
                .padding(.leading, 4)
            }

            Text("\(habit.name)")
                .font(.system(size: 15))
                .offset(x: -50, y: -20)
            Spacer()
            Button(action: {
                showLogHabit.toggle()
            }) {
                HStack {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                    Text("Log")
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                }
                .frame(width: 65, height: 25)
                .padding(4)
            }
            .background(.blue)
            .cornerRadius(40)
            .sheet(isPresented: $showLogHabit) { 
                LogHabitView(habit: $habit, showLogHabit: $showLogHabit)
            }
            
        }
        .padding()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        
    }
}

#Preview {
    HabitsView()
}
