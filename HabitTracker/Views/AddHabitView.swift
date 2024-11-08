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
    @State var color: Color = Color.red
    
    let colors: [Color] = [
        .pink.opacity(0.5), .orange.opacity(0.5), .yellow.opacity(0.5), .green.opacity(0.5), .blue.opacity(0.5),
        .purple, .red.opacity(0.5), .purple.opacity(0.5), .brown.opacity(0.5), .gray.opacity(0.5), .mint.opacity(0.7), .cyan.opacity(0.5)
    ]
    
    @State var selectedColorIndex: Int = 0
    
    var body : some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                    .keyboardType(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
                TextField("Label", text: $label)
                    .keyboardType(.default)
                Section("Color") {
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
                            }
                        }
                    }
                    .padding()
                }
                
                Section("Target") {
                    TextField("Goal", text: $goal)
                        .keyboardType(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
                    TextField("Unit", text: $unit)
                        .keyboardType(.default)
                }
            }
            .navigationBarItems(
                leading: 
                    Button("Cancel", action: {
                        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                            windowScene.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
                        }
                    })
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                ,
                trailing: Button("Add", action: {
                
                })
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .bold()
            )
            .navigationTitle("Add Habit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.light, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}
