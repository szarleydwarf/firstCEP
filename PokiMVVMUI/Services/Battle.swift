//
//  Battle.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 03/06/2021.
//

import Foundation

class Battle: ObservableObject {
    @Published var fighters = (Mobi.example, Mobi.example)

    func fight () {
    }
}
