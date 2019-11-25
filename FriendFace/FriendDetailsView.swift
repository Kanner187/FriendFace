//
//  FriendDetailsView.swift
//  FriendFace
//
//  Created by Levit Kanner on 25/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct FriendDetailsView: View {
    @State var friend: User
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FriendDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailsView(friend: User(id: UUID(), isActive: true, name: "Levit", age: 23, company: "Nikasemo", email: "lkanner21@gmail.com", address: "Amasaman", about: "An IOS developer who will be taking over the whole soon", registered: "", tags: ["Loving", "Needs time to grow"], friends: []))
    }
}
