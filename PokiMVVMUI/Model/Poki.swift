//
//  Poki.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 18/05/2021.
//

import Foundation

struct Poki: Decodable, Hashable {
    let name, element: String
    let attack, defence, exp, life: Int

    #if DEBUG
    static var example = Poki(name: "", element: "", attack: 0, defence: 0, exp: 0, life: 0)
    #endif
}
