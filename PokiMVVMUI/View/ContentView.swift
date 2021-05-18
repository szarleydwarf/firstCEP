//
//  ContentView.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 18/05/2021.
//

import SwiftUI

struct ContentView: View {
    let pokis: [Poki]
    var body: some View {
        List(pokis.indices) { index in
            PokiView(name: pokis[index].name, height: pokis[index].height, weight: pokis[index].weight)
        }
        .navigationTitle("POKIES !")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(pokis: [Poki]())
    }
}
