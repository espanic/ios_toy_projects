//
//  HabitThumbnailView.swift
//  Habit-tracking
//
//  Created by 최윤호 on 2023/01/28.
//

import SwiftUI

struct HabitThumbnailView: View {
    let habit : Habit
    var body: some View {
        VStack {
            Image(systemName: habit.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                
            VStack{
                Text(habit.title)
                    .font(.title)
                    .fontWeight(.semibold)
            }
            
        }
        .frame(width: 100, height: 100)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray))
    
    
    }
}

struct HabitThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        HabitThumbnailView(habit: Habit.sleep)
    }
}
