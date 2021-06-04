//
//  ContentView.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 18/05/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var battle: Battle
    var vm = ViewModel()

    var body: some View {
        List {
            ForEach(self.vm.mobisList) { section in
                Section(header: Text(section.element)) {
                    ForEach(section.mobies) {mobi in
                        NavigationLink(destination:
                                MobiDetails(mobi: mobi,
                                rgb: self.vm.imageColor(from: mobi.element))) {
                            MobiRow(mobi: mobi, rgb: self.vm.imageColor(from: mobi.element))
                        }
                    }
                }
            }
        }
        .navigationTitle("Mobies !")
        .listStyle(GroupedListStyle())
//        .onAppear(perform: vm.fetchPokiList)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Battle())
    }
}
