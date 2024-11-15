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
        NavigationView {
            VStack {
                List(viewModel.habitsList, id: \.id, rowContent: { habit in
                    HStack {
                        Text(habit.name)
                        Text("\(habit.progress)")
                        Text(habit.rep.rawValue)
                    }
                })
                Button("add", action: {
                })
                .sheet(isPresented: $showOverlay) {
                    AddHabitView(viewModel: viewModel)
                }
                Button("edit", action: {
//                    viewModel.logProgress(index: 0, amount: 5)
                })
                Button(action: {
                    
                }){
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 20, height:  20)
                        .foregroundColor(.blue)
                    
                }
            }
        }
        .navigationTitle("Habits")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.light, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}



#Preview {
    HabitsView()
}
