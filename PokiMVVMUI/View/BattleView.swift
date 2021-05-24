//
//  BattleView.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 21/05/2021.
//

import SwiftUI

struct BattleView: View {
    let attackingMobi: Poki
    let defendingMobi: Poki

    var body: some View {
        Text("\(attackingMobi.name)")
        Text("\(defendingMobi.name)")
    }
}

struct BattleView_Previews: PreviewProvider {
    static var previews: some View {
        BattleView(attackingMobi: Poki.example, defendingMobi: Poki.example)
    }
}
