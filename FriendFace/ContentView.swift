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
    @State private var showingAlert = false
    @State private var message = ""
    
    
    var body: some View {
        NavigationView{
            List{
                ForEach(self.users ){ user in
                    NavigationLink(destination: DetailsView(user: user , allUsers: self.users)) {
                        HStack{
                            VStack(alignment:.leading){
                                Text(user.name)
                                    .font(.headline)
                                Text(user.email)
                                    .font(.system(size: 12))
                                    .foregroundColor(.blue)
                            }
                            Spacer()
                            Text(user.isActive ? "Online" : "Offline")
                                .font(.system(size: 12))
                                .foregroundColor(user.isActive ? Color.green : Color.red)
                        }
                    }
            
                }
            }
            .navigationBarTitle("FriendFace")
        }
        .onAppear(perform: self.loadData)
        .alert(isPresented: $showingAlert) { () -> Alert in
            Alert(title: Text("Internet connection"), message: Text(self.message), dismissButton: .default(Text("Okay")))
        }
    
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
            self.message = error?.localizedDescription ?? "An error occurred"
            self.showingAlert = true
            
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static let users = [User]()
    static var previews: some View {
        ContentView(users: users)
    }
}
