//
//  ContentView.swift
//  TwitterSwiftUIClone
//
//  Created by 최윤호 on 2023/01/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    var body: some View {
        ZStack(alignment: .topLeading) {
            MainTapView()
                
            if showMenu {

                    Color(.black)
                    .opacity(showMenu ? 0.25 : 0.0)

                .onTapGesture {
                    withAnimation(.easeInOut){
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0 : -300, y: 0)
                .background(showMenu ? Color.white : Color.clear)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                Button{
                    showMenu.toggle()
                }label: {
                    Circle()
                        .frame(width: 32, height: 32)
                }
            }
        }
        .onAppear{
            showMenu = false
        }
        .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
        .animation(.easeInOut, value: showMenu)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
