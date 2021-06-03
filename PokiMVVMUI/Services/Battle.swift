//
//  Battle.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 03/06/2021.
//

import Foundation

class Battle: ObservableObject {
    @Published var fighters = (Mobi.example, Mobi.example)
    var count = 0

    func add(oponent: Mobi) {
        if count == 0 {
            fighters.0 = oponent
            count += 1
        } else {
            fighters.1 = oponent
            count = 0
        }
    }

    func fight () {
    }
}
