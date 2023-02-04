//
//  Habit.swift
//  Habit-tracking
//
//  Created by 최윤호 on 2023/01/28.
//

import Foundation

enum Habit : CaseIterable, Codable{
    case study
    case sleep
    case practice_piano
    case cook
    case work
    case mount_hike
    case date
    
    var title : String {
        switch self {
        case .study:
            return "study"
        case .sleep:
            return "sleep"
        case .practice_piano:
            return "piano"
        case .cook:
            return "cook"
        case .work:
            return "work"
        case .mount_hike:
            return "hiking"
        case .date:
            return "date"
        }
    }
    
    var imageName : String {
        switch self {
        case .study:
            return "text.book.closed"
        case .sleep:
            return "bed.double"
        case .practice_piano:
            return "pianokeys"
        case .cook:
            return "cooktop"
        case .work:
            return "keyboard"
        case .mount_hike:
            return "mountain.2"
        case .date:
            return "heart"
        }
    }
}
