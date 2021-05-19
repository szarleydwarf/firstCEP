//
//  ViewModel.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 19/05/2021.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var pokis: [Poki] = Array(repeating: Poki.example, count: 10)

    func fetchPokiList() {
    }

    func fetchPoki() {
    }
}
