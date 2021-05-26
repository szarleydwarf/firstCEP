//
//  Mobis.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 18/05/2021.
//

import Foundation

struct MobiElements: Decodable, Hashable, Identifiable {
    var id: UUID
    var element: String
    var mobies: [Mobi]

}

struct Mobi: Decodable, Hashable, Identifiable {
    let id: UUID
    let name, element: String
    let attack, defence, exp, life: Int

    #if DEBUG
    static var example = Mobi(id: UUID(), name: "", element: "", attack: 0, defence: 0, exp: 0, life: 0)
    #endif
}
