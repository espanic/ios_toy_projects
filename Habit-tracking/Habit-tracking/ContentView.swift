//
//  ContentView.swift
//  Habit-tracking
//
//  Created by 최윤호 on 2023/01/28.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habits = MyHabits()
    @State private var isPresented = false
    let columns = [
        GridItem(.adaptive(minimum: 60))
    ]
    var body: some View {
        NavigationView {
            List{
                ForEach(habits.items){habit in
                    HStack{
                        Image(systemName: habit.habit.imageName)
                            .frame(width: 30, height: 30)
                        Rectangle()
                            .frame(width: 2)
                            .foregroundColor(.gray.opacity(0.5))
                        VStack(alignment: .leading){
                            Text(habit.habit.title)
                                .font(.body)
                                .fontWeight(.semibold)
                            Text(habit.dateFormattedString)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        
                    }
                    .padding(.vertical, 4)
                }
                .onDelete { indexSet in
                    habits.items.remove(atOffsets: indexSet)
                }
            }
            .toolbar(content: {
    
                Button{
                    isPresented = true
                }label: {
                    Image(systemName: "plus")
                }
            })
            .navigationTitle("한 일 저장하기")
            
            
        }
        .sheet(isPresented: $isPresented) {
            AddHabitView(habits: habits)
        }

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
