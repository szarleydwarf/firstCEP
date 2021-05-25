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
            ScrollView(.vertical) {
                ScrollViewReader {scrollView in
                    ForEach((0..<defendingMobi.life).reversed(), id: \.self) {id in
                        Text("LOL>\(id)")
                    }
                    if self.vm.defender?.life ?? -1 > 0 {
                        Text("fight")
                        AttackView(text: self.vm.attack())
                    }
                }
            }
        }
    }
}

struct BattleView_Previews: PreviewProvider {
    static var previews: some View {
        BattleView(attackingMobi: Poki.example, defendingMobi: Poki.example)
    }
}
