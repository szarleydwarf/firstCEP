//
//  ViewModel.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 19/05/2021.
//

import Foundation

class ViewModel: ObservableObject {
    var mobisList: [MobiElements] = {
        return Services().fetchLocalFile([MobiElements].self, from: "pokis")
    }()

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

    func imageColor(from element: String) -> RGB {
        var color: RGB
        switch element {
        case "fire":
            color = RGB(r: 1, g: 0, b: 0)
        case "water":
            color = RGB(r: 0, g: 0, b: 1)
        case "earth":
            color = RGB(r: 0.6, g: 0.4, b: 0.2)
        case "air":
            color = RGB(r: 0.5, g: 0.5, b: 0.5)
        default:
            color = RGB(r: 1, g: 1, b: 1)
        }
        return color
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
