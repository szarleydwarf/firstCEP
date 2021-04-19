//
//  ContentView.swift
//  FirstCEP
//
//  Created by The App Experts on 14/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let viewModel = ViewModel()
        
    @State private var selected = 0
    
    var body: some View {
        NavigationView{
            List{
                ForEach(0 ..< viewModel.accountsCount){ i in
                    Text("\(viewModel.accounts?[i].getName() ?? "") \(viewModel.accounts?[i].getNumber() ?? "") \(viewModel.accounts?[i].getBalance() ?? "")")
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
