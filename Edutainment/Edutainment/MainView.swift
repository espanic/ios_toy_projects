//
//  ContentView.swift
//  Edutainment
//
//  Created by 최윤호 on 2023/01/18.
//

import SwiftUI

class SettingToggle : ObservableObject{
    @Published var isSettingDisplayed = true
}

struct MainView: View {
    @ObservedObject var settingToggle = SettingToggle()
    @ObservedObject var settings = Settings()
    
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.red, .yellow]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                Group {
                    if(settingToggle.isSettingDisplayed){
                        SettingView(settingToggle: settingToggle, settings: settings)
                    }else{
                        ProblemSolvingView(settingToggle: settingToggle, settings: settings)
                    }
                    
                }
            
            }
            .navigationTitle("play with numbers")
            
        }
    
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
