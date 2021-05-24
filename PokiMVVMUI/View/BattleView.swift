//
//  BattleView.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 21/05/2021.
//

import SwiftUI

struct BattleView: View {
    var attackingMobi: Poki
    var defendingMobi: Poki

    var body: some View {
        HStack {
            Text("Atacking > \(attackingMobi.name)")
            Text("Defending > \(defendingMobi.name)")
        }
    }
}

struct BattleView_Previews: PreviewProvider {
    static var previews: some View {
        BattleView(attackingMobi: Poki.example, defendingMobi: Poki.example)
    }
}
