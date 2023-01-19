//
//  SettingView.swift
//  Edutainment
//
//  Created by 최윤호 on 2023/01/19.
//

import SwiftUI

struct SettingView: View {
    @ObservedObject var settingToggle : SettingToggle
    @ObservedObject var settings : Settings
    var body: some View {
        VStack{
            Form {
                Section(
                    header: Text("구구단 단수는?")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                ) {
                    Stepper("구구단 \(settings.step)단", value: $settings.step, in: 2...12)
                }
                
                Section(
                    header: Text("문제의 개수를 고르시오. ")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                ){
                    Picker("\(settings.questionCount.rawValue) 개", selection: $settings.questionCount) {
                        ForEach(QuestionCountCategory.allCases, id: \.self) { questionCount in
                            Text("\(questionCount.rawValue)")
                        }
                    }
                }
                
            }

            .scrollContentBackground(.hidden)
            .layoutPriority(0)
            Button("Start"){
                settingToggle.isSettingDisplayed.toggle()
                
            }
            .font(.largeTitle)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .padding()
            Spacer()
            
        }

    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(settingToggle: SettingToggle(), settings: Settings())
    }
}
