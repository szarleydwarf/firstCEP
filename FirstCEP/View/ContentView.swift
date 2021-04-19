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
                ForEach(0 ..< viewModel.accountsCount){ index in
                    self.updateView(index)
                }
            }
            .navigationBarTitle("Accounts", displayMode: .inline)
        }
    }
    
    func updateView(_ index:Int) {
        Text("\(viewModel.accounts?[index].getName() ?? "") \(viewModel.accounts?[index].getNumber() ?? "") \(viewModel.accounts?[index].getBalance() ?? "")")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
