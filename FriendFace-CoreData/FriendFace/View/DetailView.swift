//
//  DetailView.swift
//  FriendFace
//
//  Created by 최윤호 on 2023/02/04.
//

import SwiftUI

struct InformationCard : View{
    let title : String
    let data : String
    
    var body: some View{
        
        HStack{
            Text(title)
                .font(.headline)
            Spacer(minLength: 20)
            Text(data)
                .font(.body)
        }
        //            frame(minWidth: .infinity)
        
    }
    
}



struct DetailView: View {
    let user : User
    var friends : [User] {
        user.friendsArray
    }
    var body: some View {
        NavigationStack{
            List{
                Section{
                    InformationCard(title: "Name", data: user.wrappedName)
                    InformationCard(title: "Age", data: user.age.formatted())
                    InformationCard(title: "Company", data: user.wrappedCompany)
                    InformationCard(title: "Email", data: user.wrappedEmail)
                    InformationCard(title: "Address", data: user.wrappedAdress)
                    InformationCard(title: "Registered", data: user.wrappedRegistered.formatted())
                    
                }header: {
                    Text("General Information")
                }
                
                Section{
                    Text(user.wrappedAbout)
                }header: {
                    Text("About")
                }
                
                Section{
                    ForEach(friends, id: \.id){ friend in
                        
                        NavigationLink {
                            DetailView(user: friend)
                        } label: {
                            HStack{
                                VStack(alignment: .leading){
                                    Text(friend.wrappedName)
                                        .font(.headline)
                                    Text(friend.wrappedEmail)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                
                            }
                            
                        }
                    }
                }header: {
                    Text("Friends")
                }
            }
            .navigationTitle(user.wrappedName)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


