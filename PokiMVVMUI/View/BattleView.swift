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
        HStack {
            MobiDetails(mobi: battle.fighters.0, rgb: RGB(r: 1, g: 0, b: 0), imageSize: (100, 100))
            MobiDetails(mobi: battle.fighters.1, rgb: RGB(r: 0, g: 1, b: 0.5), imageSize: (100, 100))
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
