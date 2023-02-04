//
//  HabitWithDate.swift
//  Habit-tracking
//
//  Created by 최윤호 on 2023/01/28.
//

import Foundation

struct HabitWithDate : Codable, Identifiable, Comparable {
    
    
    static func < (lhs: HabitWithDate, rhs: HabitWithDate) -> Bool {
        lhs.date < rhs.date
    }
    
    var id = UUID()
    var habit : Habit
    var date : Date
    
    var dateFormattedString : String {
        date.formatted()
    }
}
