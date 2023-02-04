//
//  AddHabitView.swift
//  Habit-tracking
//
//  Created by 최윤호 on 2023/01/28.
//

import SwiftUI

struct AddHabitView: View {
    @ObservedObject var habits : MyHabits
    @State private var date = Date.now
    @State private var selectedHabit : Habit?
    @Environment(\.dismiss) var dismiss
    let columns = [
        GridItem(.adaptive(minimum: 95))
    ]
    var body: some View {
        NavigationStack {
            Form{
                Section{
                    HStack{
                        Spacer()
                        DatePicker( "",selection: $date)
                            .datePickerStyle(.wheel)
                            .labelsHidden()
                        Spacer()
                        
                    }
                    
                }header: {
                    Text("Pick Date")
                }
                
                
                Section{
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(Habit.allCases, id: \.title){ habit in
                            Button{
                                selectedHabit = habit
                            }label: {
                                if(selectedHabit == habit){
                                    HabitThumbnailView(habit: habit)
                                        .overlay(RoundedRectangle(cornerRadius: 10)
                                            .stroke(.blue, lineWidth: 3))
                                }else{
                                    HabitThumbnailView(habit: habit)
                                }
                                
                            }
                            .buttonStyle(PlainButtonStyle())

                            
                        }
                    }
                }header: {
                    Text("Pick Habit")
                }
            }
            .navigationTitle("Add Habit")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel", role: .cancel){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Save"){
                        habits.items.append(HabitWithDate(habit: selectedHabit!, date: date))
                        dismiss()
                    }
                    .disabled(selectedHabit == nil)
                }
            }
            
            
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habits: MyHabits())
    }
}
