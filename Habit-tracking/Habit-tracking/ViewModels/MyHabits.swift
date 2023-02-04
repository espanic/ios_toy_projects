//
//  MyHabits.swift
//  Habit-tracking
//
//  Created by 최윤호 on 2023/01/28.
//

import Foundation

class MyHabits : ObservableObject {
    @Published var items : [HabitWithDate] = [] {
        didSet{
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items){
                UserDefaults.standard.set(encoded, forKey: "habits")
            }
        }
    }
    
    init() {
        if let savedHabits = UserDefaults.standard.data(forKey: "habits"){
            if let decodedHabits = try? JSONDecoder().decode([HabitWithDate].self, from: savedHabits){
                items = decodedHabits
                return
            }
        }
    }
    
    
}
