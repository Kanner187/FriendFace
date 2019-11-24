//
//  ContentView.swift
//  FriendFace
//
//  Created by Levit Kanner on 24/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //Properties
   @State var users = [User]()
    
    
    var body: some View {
        Text("\(self.users.count)")
            .onAppear(perform: self.loadData)
    }
    
    
    
    
    
    //Load Data from url
    func loadData(){
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("invalid url")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
        
            if let pulledData = data{
                
                if let decodedData = try? JSONDecoder().decode([User].self, from: pulledData) {
                    
                    DispatchQueue.main.async {
                        self.users = decodedData
                    }
                    
                    return
                }
            }
            print("Error occurred: \(error?.localizedDescription ?? "Decoding error")")
            
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static let users = [User]()
    static var previews: some View {
        ContentView(users: users)
    }
}
