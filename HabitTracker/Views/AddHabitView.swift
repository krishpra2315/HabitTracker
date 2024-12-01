//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Vedant Bhatt on 11/4/24.
//

import Foundation
import SwiftUI

struct AddHabitView: View {
    @ObservedObject var viewModel: HabitsViewModel
    @State var name: String = ""
    @State var label: String = ""
    @State var goal: String = ""
    @State var unit: String = ""
    @State var color: Color = .pink.opacity(0.5)
    @State var selectedColorIndex: Int = 0
    @State private var selectedOption: Repeat = Repeat.DAILY
    
    let colors: [Color] = [
        .pink.opacity(0.5), .orange.opacity(0.5), .yellow.opacity(0.5), .green.opacity(0.5), .blue.opacity(0.5),
        .purple, .red.opacity(0.5), .purple.opacity(0.5), .brown.opacity(0.5), .gray.opacity(0.5), .mint.opacity(0.7), .cyan.opacity(0.5)
    ]
    
    let options: [Repeat] = [
        Repeat.DAILY,
        Repeat.WEEKDAYS,
        Repeat.WEEKENDS,
        Repeat.WEEKLY
    ]
    
    var body : some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                    .keyboardType(.default)
                    .foregroundColor(.black)
                TextField("Label", text: $label)
                    .keyboardType(.default)
                    .foregroundColor(.black)
                
                Section(header: Text("COLOR").foregroundColor(.gray)) {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 6), spacing: 16) {
                        ForEach(colors.indices, id: \.self) { index in
                            ZStack {
                                Circle()
                                    .fill(colors[index])
                                    .frame(width: 42, height: 42)
                                
                                // Outline circle if selected
                                if selectedColorIndex == index {
                                    Circle()
                                        .stroke(Color.gray, lineWidth: 3)
                                        .frame(width: 47, height: 47)
                                }
                            }
                            .onTapGesture {
                                selectedColorIndex = index
                                color = colors[selectedColorIndex]
                            }
                        }
                    }
                }
                
                Section(header: Text("TARGET").foregroundColor(.gray)) {
                    TextField("Goal", text: $goal)
                        .keyboardType(.numberPad)
                        .foregroundColor(.black)
                    TextField("Unit", text: $unit)
                        .keyboardType(.default)
                        .foregroundColor(.black)
                }
                
                Section(header: Text("REPEAT").foregroundColor(.gray)) {
                    ForEach(options, id: \.self) { option in
                        HStack {
                            Text(option.rawValue)
                                .foregroundColor(.primary)
                            Spacer()
                            if option == selectedOption {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.blue)
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedOption = option
                        }
                    }
                    
                    NavigationLink(destination: CustomRepeatView(viewModel: viewModel)) {
                        Text("Custom")
                            .foregroundColor(.primary)
                    }.onTapGesture {
                        selectedOption = Repeat.CUSTOM
                    }
                }
            }
            .navigationBarItems(
                leading: 
                Button("Cancel", action: {
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                        windowScene.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
                    }
                })
                .foregroundColor(.blue)
                ,
                trailing: Button("Add", action: {
                   
                    viewModel.addHabit(name: name, label: label, color: color, goal: Int(goal)!, unit: unit, rep: selectedOption)
                    
                    name = ""
                    label = ""
                    goal = ""
                    unit = ""
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                        windowScene.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
                    }
                })
                .foregroundColor(.blue)
                .bold()
            )
            .navigationTitle("Add Habit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.light, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

struct CustomRepeatView: View {
    @ObservedObject var viewModel: HabitsViewModel
    let options: [Repeat] = [
        Repeat.MONDAY,
        Repeat.TUESDAY,
        Repeat.WEDNESDAY,
        Repeat.THURSDAY,
        Repeat.FRIDAY,
        Repeat.SATURDAY,
        Repeat.SUNDAY
    ]
    
    @State private var selectedValues: Set<Repeat> = Set()
    
    var body: some View {
        Form {
            Section(header: Text("CUSTOM").foregroundColor(.gray)) {
                ForEach(options, id: \.self) { option in
                    HStack {
                        Text(option.rawValue)
                            .foregroundColor(.black)
                        Spacer()
                        if selectedValues.contains(option) {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedValues.insert(option)
                    }
                }
            }
        }
    }
}

#Preview {
    HabitsView()
}
