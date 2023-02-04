//
//  ContentView.swift
//  FriendFace
//
//  Created by 최윤호 on 2023/02/03.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel : UserViewModel
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.users, id: \.data.id) { user in
                    NavigationLink{
                        DetailView(user: user)
                    }label: {
                        HStack{
                            VStack(alignment: .leading){
                                Text(user.data.name)
                                    .font(.headline)
                                Text(user.data.email)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                    }
                }
                
            }
            .listStyle(.grouped)
            .navigationTitle("User List")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                Task{
                    print("task start")
                    await viewModel.loadUsers(url: URL(string: "https://www.hackingwithswift.com/samples/friendface.json"))
                    print("task end")
                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Reload"){
                        Task{
                            print("task start")
                            await viewModel.loadUsers(url: URL(string: "https://www.hackingwithswift.com/samples/friendface.json"))
                            print("task end")
                        }
                    }
                }
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static let envObject = UserViewModel()
    static var previews: some View {

        ContentView()
            .environmentObject(envObject)
    }
}

