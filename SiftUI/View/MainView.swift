//
//  MainView.swift
//  SiftUI
//
//  Created by The App Experts on 05/05/2021.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var transfer: Transfer

    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Account List", systemImage: "list.dash")
                }
            TransferView(transfer: Transfer.example)
                .tabItem {
                    Label("Transfer", systemImage: "paperplane.fill")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Transfer())
    }
}
