//
//  ContentView.swift
//  FirstCEP
//
//  Created by The App Experts on 14/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let accounts:[Account] = ViewModel().getData(from: "Accounts")
    @State private var selected = 0
    
    var body: some View {
        NavigationView{
            List{
                ForEach(0 ..< accounts.count) { index in
                    Text("\(self.accounts[index].getName() ) \(self.accounts[index].getNumber() ) \(self.accounts[index].getBalance())")
                        .padding()
                }
            }
            .navigationBarTitle("Accounts", displayMode: .inline)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
