//
//  MainView.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 04/06/2021.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var battle: Battle
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Mobies", systemImage: "list.dash")
                }
            BattleView()
                .tabItem {
                    Label("Battle", systemImage: "pencil.slash")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Battle())
    }
}
