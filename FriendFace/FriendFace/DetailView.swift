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
    let user : ObserableUser
    var data : UserData {
        user.data
    }
    var friends : [ObserableUser] {
        user.friends
    }
    var body: some View {
        NavigationStack{
            List{
                Section{
                    InformationCard(title: "Name", data: data.name)
                    InformationCard(title: "Age", data: data.age.formatted())
                    InformationCard(title: "Company", data: data.company)
                    InformationCard(title: "Email", data: data.email)
                    InformationCard(title: "Address", data: data.address)
                    
                }header: {
                    Text("General Information")
                }
                
                Section{
                    Text(data.about)
                }header: {
                    Text("About")
                }
                
                Section{
                    ForEach(friends, id: \.data.id){ friend in
                        
                        NavigationLink {
                            DetailView(user: friend)
                        } label: {
                            HStack{
                                VStack(alignment: .leading){
                                    Text(friend.data.name)
                                        .font(.headline)
                                    Text(friend.data.email)
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
            .navigationTitle(data.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: ObserableUser(user: UserData(id: "1111-1111-1111-1111", isActive: false, name: "Harry Potter", age: 21, company: "Hogwart", email: "dddd@gmail.com", address: "Seoul 2220-333", about: "sdfasfsafasfasfasfsdff dfsfsafsaf sad dsf sdf ", tags: ["dfdf"], friends: [])))
    }
}
