//
//  DetailsView.swift
//  FriendFace
//
//  Created by Levit Kanner on 25/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct DetailsView: View {
    @State var user: User
    let allUsers : [User]
    
    var tagString: String{
        var string = ""
        for tag in user.tags{
            let stag = tag + ", "
            string.append(stag)
        }
        return string
    }
    
    
    //Computed Friends
    
    var friendList: [User]{
        var friends = [User]()
        
        for friend in self.user.friends{
            if let match = allUsers.first(where: {
                $0.id == friend.id
            }){
                friends.append(match)
            }else {
                fatalError("Missing \(friend)")
            }
        }
        return friends
    }
    
    
    
    var body: some View {
        GeometryReader{ geometry in
            ScrollView{
                Text(self.user.name)
                .font(.title)
                .padding()
                
                Divider()
                //FIRST SECTION
                Section(header:Text("Personal")
                    .foregroundColor(.secondary)){
                        
                    VStack(alignment: .leading , spacing: 10){
                    
                        HStack{
                          Text("Age:          ")
                          Text("\(self.user.age)")
                            .font(.system(size: 16))
                            .foregroundColor(.blue)
                        }
                        HStack{
                          Text("Email:       ")
                          Text(self.user.email)
                            .font(.system(size: 16))
                            .foregroundColor(.blue)
                        }
                        HStack{
                          Text("Company:")
                          Text(self.user.company)
                            .font(.system(size: 16))
                            .foregroundColor(.blue)
                        }
                        HStack{
                          Text("Address:  ")
                          Text(self.user.address)
                            .font(.system(size: 16))
                            .foregroundColor(.blue)
                        }
                    }
                }
                .frame(maxWidth: geometry.size.width)
                .padding(8)
                
                
                //SECOND SECTION
                Section(header: Text("About").foregroundColor(.secondary)){
                    VStack(alignment: .leading){
                        Text(self.user.about)
                        
                        HStack(alignment: .center , spacing: 10){
                            Text("Registered Date:")
                            Text("\(self.user.registered)")
                            .font(.system(size: 16))
                            .foregroundColor(.blue)
                        }
                        
                    }
                }
                .frame(maxWidth: geometry.size.width)
                .padding(8)
                
                
                //THIRD SECTION
                Section{
                    HStack(alignment: .top){
                        Text("Tags: ")
                        Text(self.tagString)
                            .font(.system(size: 16))
                            .foregroundColor(.blue)
                    }
                    
                }
                .frame(maxWidth: geometry.size.width)
                .padding(.top)
                
                
                //Friend List
                Section(header: Text("Friends").foregroundColor(.secondary)){
                    
                    ForEach(self.friendList){ friend in
                        NavigationLink(destination: DetailsView(user: friend, allUsers: self.allUsers)) {
                            HStack{
                                VStack(alignment: .leading){
                                    Text(friend.name)
                                        .font(.headline)
                                    HStack{
                                        Text("Company:")
                                        .font(.system(size: 14))
                                        
                                        Text(friend.company)
                                        .font(.system(size: 14))
                                            .foregroundColor(.blue)
                                    }
                                    
                                }
                                Spacer()
                                Text(friend.isActive ? "Online" : "Offline")
                                    .font(.system(size: 14))
                                    .foregroundColor(friend.isActive ? .green : .red)
                                    
                            }
                        }
                    .buttonStyle(PlainButtonStyle())
                    }
                }
                .frame(maxWidth: geometry.size.width)
                .padding()
            
            }
        }
            .navigationBarTitle(Text(self.user.name) , displayMode: .inline)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(user: User(id: UUID(), isActive: true, name: "Levit", age: 23, company: "Nikasemo", email: "lkanner21@gmail.com", address: "Amasaman", about: "An IOS developer who will be taking over the whole soon", registered: "", tags: ["Loving", "Needs time to grow"], friends: []), allUsers: [User]())
    }
}
