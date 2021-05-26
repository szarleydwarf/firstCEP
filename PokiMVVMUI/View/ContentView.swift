//
//  ContentView.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 18/05/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel()

    var body: some View {
        List {
            }
        .navigationTitle("Mobies !")
        .onAppear(perform: vm.fetchPokiList)
//        .onAppear(perform: vm.getUUID)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
