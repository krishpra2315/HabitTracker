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
                    CalendarSlider()
                    Divider()
                    ForEach(viewModel.groupedHabits.keys.sorted(), id: \.self) { group in
                        
                        if let habits = viewModel.groupedHabits[group], !habits.isEmpty {
                            Section(
                                header:
                                    Text(group.uppercased())
                                    .padding(.leading, 13)
                                    .font(.system(size: 14))
                            ) {
                                ForEach(habits, id: \.id) { habit in
                                    HabitsRow(habit: .constant(habit))
                                    Divider()
                                }
                            }
                        }
                    }
                    Spacer()
                    
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
                    .offset(x: -10)
                
                Text("\(habit.label)")
                    .offset(x: -10)
            }
            .padding(.leading, 3)
            
            VStack(alignment: .leading, spacing: -10) {
                Text("\(habit.name)")
                    .font(.system(size: 15))
                
                HStack(spacing: -25) {
                    Text("\(habit.progress)")
                        .font(.system(size: 40, design: .monospaced))
                        .offset(x: -14, y: 16)
                        .padding(.trailing, 4)
                    
                    Text("/")
                        .font(.system(size: 34, design: .monospaced))
                        .offset(x: 7, y: 16)
                    VStack(alignment: .leading) {
                        Text("\(habit.goal)")
                            .font(.system(size: 13, design: .monospaced))
                            .bold()
                        
                        Text("\(habit.unit)")
                            .font(.system(size: 13, design: .monospaced))
                            .bold()
                    }
                    .offset(x: 29, y: 16)
                    .padding(.leading, 4)
                }
                .padding(.leading, 10)
            }

            
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

struct CalendarSlider: View {
    let daysOfWeek = ["S", "M", "Tu", "W", "Th", "F", "Su"]
    let datesOfWeek = ["S": "1", "M": "2", "Tu": "3", "W": "4", "Th": "5", "F": "6", "Su": "7"]
    @State private var selectedDate: String = "Tu" // Example of selected date
    
    var body: some View {
        VStack {
            // Calendar slider
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(daysOfWeek, id: \.self) { day in
                        Button(action: {
                        }) {
                            VStack {
                                Text(day)
                                    .foregroundColor(self.selectedDate == day ? .red : .gray)
                                    .font(.system(size: 10))
                                
                                Text(datesOfWeek[day]!)
                                    .foregroundColor(.black)
                                    .font(.system(size: 20, design: .monospaced))
                                    .bold()
                                    .frame(width: 30, height: 30)
                                    .cornerRadius(30)
                                    .background(self.selectedDate == day ? Color.gray.opacity(0.2) : Color.clear)
                            }
                            .frame(width: 40, height: 40)
                            .padding(5)
                        }
                    }
                }
            }
            .frame(height: 70)
        }
    }
}

#Preview {
    HabitsView()
}
