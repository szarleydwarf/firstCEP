//
//  ViewModel.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 19/05/2021.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var pokis: [Poki] = Array(repeating: Poki.example, count: 2)

    func fetchPokiList() {
        self.pokis = Services().fetchLocalFile(from: "pokis")
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

    func attack(attacker: Poki, defender: Poki) -> String {
        let damage = defender.life - (defender.defence - attacker.attack)
        return "\n Caused damage \(damage)"
    }
}
