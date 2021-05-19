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
        List(vm.pokis.indices) { index in
            if let poki = vm.pokis[index] {
                PokiView(name: poki.name)
            }
        }
        .navigationTitle("POKIES !")
        .onAppear(perform: vm.fetchPokiList)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
