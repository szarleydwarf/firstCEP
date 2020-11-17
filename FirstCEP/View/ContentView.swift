//
//  ContentView.swift
//  FirstCEP
//
//  Created by The App Experts on 14/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let accounts = APIServiceVM().fetchDataFromLocalFile(from: "Accounts")
    
    var body: some View {
        NavigationView{
            List {
                Text("1. Account kind + title\nnumber\ncurrency + balance")
                Text("2. Account kind + title\nnumber\ncurrency + balance")
                Text("3. Account kind + title\nnumber\ncurrency + balance")
            }
        .navigationBarTitle("Accounts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
