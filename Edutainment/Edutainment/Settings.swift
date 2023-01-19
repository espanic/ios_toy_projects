//
//  Settings.swift
//  Edutainment
//
//  Created by 최윤호 on 2023/01/19.
//

import Foundation

enum QuestionCountCategory : Int, CaseIterable,Identifiable {
    var id: Self {
        return self
    }
    case FIVE = 5
    case TEN = 10
    case TWENTY = 20
}


class Settings : ObservableObject {
    @Published var questionCount = QuestionCountCategory.FIVE
    @Published var step  =  2
    
    

    
}
