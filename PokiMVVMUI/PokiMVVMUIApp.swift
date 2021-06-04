//
//  PokiMVVMUIApp.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 18/05/2021.
//

import SwiftUI

@main
struct PokiMVVMUIApp: App {
    @StateObject var battle = Battle()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView()
                    .environmentObject(battle)
            }
        }
    }
}
