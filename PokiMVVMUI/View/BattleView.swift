//
//  BattleView.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 04/06/2021.
//

import SwiftUI

struct BattleView: View {
    @EnvironmentObject var battle: Battle
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct BattleView_Previews: PreviewProvider {
    static var previews: some View {
        BattleView()
            .environmentObject(Battle())
    }
}
