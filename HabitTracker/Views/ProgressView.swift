//
//  ProgressView.swift
//  HabitTracker
//
//  Created by Krish Prasad on 12/1/24.
//

import SwiftUI

struct ProgressView: View {
    @StateObject var viewModel: HabitsViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                CalendarSlider()
                Divider()
                VStack(alignment: .leading, spacing: 10) {
                    Text("Completed Goals:")
                        .font(.system(size: 25, weight: .bold))
                        .padding(.bottom, 10)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text("Daily:")
                                .font(.system(size: 20))
                                .foregroundColor(.blue)
                            Spacer()
                            Text("\(viewModel.completedGoals["DAILY"]!)")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                        }
                        HStack {
                            Text("Weekly:")
                                .font(.system(size: 20))
                                .foregroundColor(.blue)
                            Spacer()
                            Text("\(viewModel.completedGoals["WEEKLY"]!)")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                        }
                        HStack {
                            Text("Weekdays:")
                                .font(.system(size: 20))
                                .foregroundColor(.blue)
                            Spacer()
                            Text("\(viewModel.completedGoals["WEEKDAYS"]!)")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                        }
                        HStack {
                            Text("Weekends:")
                                .font(.system(size: 20))
                                .foregroundColor(.blue)
                            Spacer()
                            Text("\(viewModel.completedGoals["WEEKENDS"]!)")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                        }
                        HStack {
                            Text("Custom:")
                                .font(.system(size: 20))
                                .foregroundColor(.blue)
                            Spacer()
                            Text("\(viewModel.completedGoals["CUSTOM"]!)")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                        }
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                }
                .padding(.horizontal)
                Spacer()
            }
            .navigationTitle("Weekly Progress")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbarColorScheme(.light, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    HabitsView()
}
