//
//  SiftUIApp.swift
//  SiftUI
//
//  Created by The App Experts on 26/04/2021.
//

import SwiftUI

@main
struct SiftUIApp: App {
    @StateObject var transfer = Transfer()

    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(transfer)
        }
    }
}
