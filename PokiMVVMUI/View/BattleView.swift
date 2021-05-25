//
//  BattleView.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 21/05/2021.
//

import SwiftUI
import Combine

struct BattleView: View {
    @StateObject private var vm = ViewModel()
    var attackingMobi: Poki
    var defendingMobi: Poki

    var body: some View {
        VStack {
            HStack {
                Text("Atacking")
                Text("Defending")
            }
            HStack {
                Text("\(attackingMobi.name)")
                Text("\(defendingMobi.name)")
            }
            .foregroundColor(.green)
            ScrollView(.vertical) {
                ScrollViewReader {scrollView in
                    ForEach((0..<defendingMobi.life).reversed(), id: \.self) {id in
                        if defendingMobi.life > 0 {
                            AttackView(text: self.vm.attack(attacker: attackingMobi, defender: defendingMobi))
                            AttackView(text: "LOL>\(id)")
                        }
                    }
                }
            }
            .frame(width: 280, height: 100, alignment: .center)
        }
    }
}

struct BattleView_Previews: PreviewProvider {
    static var previews: some View {
        BattleView(attackingMobi: Poki.example, defendingMobi: Poki.example)
    }
}
