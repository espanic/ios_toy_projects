//
//  ContentView.swift
//  FriendFace
//
//  Created by 최윤호 on 2023/02/03.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject var viewModel : UserViewModel
    @FetchRequest(sortDescriptors: []) var users : FetchedResults<User>
    var body: some View {
        NavigationStack{
            List{
                ForEach(users, id: \.id) { user in
                    NavigationLink{
                        DetailView(user: user)
                    }label: {
                        HStack{
                            Circle()
                                .foregroundColor(user.isActive ? .green : .red)
                                .frame(width: 10, height: 10)
                            VStack(alignment: .leading){
                                Text(user.wrappedName)
                                    .font(.headline)
                                Text(user.wrappedEmail)
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Reload"){
                        Task{
                            print("task start")
                            await viewModel.loadUsers(url: URL(string: "https://www.hackingwithswift.com/samples/friendface.json"), moc: moc)
                            print("task end")
                        }
                    }
                }
            }
        }
        .task {
            print("task start")
            await viewModel.loadUsers(url: URL(string: "https://www.hackingwithswift.com/samples/friendface.json"), moc: moc)
            print("task end")
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

