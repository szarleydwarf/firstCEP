//
//  ContentView.swift
//  FirstCEP
//
//  Created by The App Experts on 14/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let accounts:[Account] = APIServiceVM().fetchDataFromLocalFile(from: "Accounts")
    @State private var selected = 0
    
    var body: some View {
        NavigationView{
            List{
                ForEach(0 ..< accounts.count){ i in
                    Text("\(self.accounts[i].getName()) \(self.accounts[i].getNumber()) \(self.accounts[i].getBalance())")
                }
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
