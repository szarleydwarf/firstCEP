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
        VStack {
            Text(battle.fighters.0.name)
            Text(battle.fighters.1.name)
        }
        .navigationTitle("Battle")
    }
}

struct BattleView_Previews: PreviewProvider {
    static var previews: some View {
        BattleView()
            .environmentObject(Battle())
    }
}
