//
//  ViewModel.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 19/05/2021.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var pokis: [Poki] = Array(repeating: Poki.example, count: 2)
    var attacker, defender: Poki?

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

    func attack() -> String {
        var text: String = "\(attacker?.name ?? "") attack with strength \(attacker?.attack ?? 0)\n"
        text += "\(defender?.name ?? "") defend is \(defender?.defence ?? 0)"
        if let life = defender?.life, let defence = defender?.defence, let attack = attacker?.attack {
            let damage = life - (defence - attack)
            text += "\n causing damage \(damage)"
        }

        return text
    }
}
