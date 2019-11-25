//
//  User.swift
//  FriendFace
//
//  Created by Levit Kanner on 24/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import Foundation

struct User: Codable , Identifiable{
    
    let id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [Friend]
}

