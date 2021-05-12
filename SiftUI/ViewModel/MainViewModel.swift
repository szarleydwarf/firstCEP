//
//  MainViewModel.swift
//  SiftUI
//
//  Created by The App Experts on 26/04/2021.
//

import Combine
import Foundation

class ViewModel {
    var service: NetworKingProtocol!
    var localService: LocalDataProtocol!
    var observer: AnyCancellable?

    init(services: NetworKingProtocol = NetworKing(), localService: LocalDataProtocol = NetworKing()) {
        self.service = services
        self.localService = localService
    }

    var accounts: [Account]?

    // this returns 1 always, need to find out why
    var accountsCount: Int {
        return accounts?.count ?? 1
    }

    let imageNames: [(String, String)] = [
        ("loan", "pencil.circle"),
        ("current", "scribble"),
        ("savings", "book"),
        ("term", "lock.doc"),
        ("d", "paperplane")
    ]

    func imageName(kind: String?) -> String {
        if let kind = kind {
            for imageName in imageNames where kind == imageName.0 {
                    return imageName.1
            }
        }
        return imageNames.last?.1 ?? "paperplane"
    }

    func getData (from: URL) -> [Account] {
        guard let acc = self.accounts else {return []}
        return acc
    }

    func getData (from fileNamed: String) -> [Account] {
        self.accounts = self.localService.fetchDataFromLocalFile(from: fileNamed)
        guard let acc = self.accounts else {return []}
        return acc
    }
}
