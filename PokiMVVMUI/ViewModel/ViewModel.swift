//
//  ViewModel.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 19/05/2021.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var mobisList: [MobiElements]?// = Array(repeating: [Mobi.example], count: 2)

    func fetchPokiList() {
        self.mobisList = Services().fetchLocalFile([MobiElements].self, from: "pokis")
    }

    func imageName(from element: String) -> String {
        var name: String
        switch element {
        case "fire":
            name = "flame"
        case "water":
            name = "waveform"
        case "earth":
            name = "square.stack.3d.up"
        case "air":
            name = "leaf"
        default:
            name  = "questionmark.diamond"
        }
        return name
    }

    func fetchPoki() {
    }

    func getUUID() {
        for _ in 1...12 {
            print(UUID().uuidString)
        }
    }

    func attack(attacker: Mobi, defender: Mobi) -> String {
        let damage = defender.life - (defender.defence - attacker.attack)
        return "\n Caused damage \(damage)"
    }
}
