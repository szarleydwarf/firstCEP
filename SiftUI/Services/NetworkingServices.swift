//
//  NetworkingServices.swift
//  SiftUI
//
//  Created by The App Experts on 26/04/2021.
//

import Combine
import Foundation

enum NetworkError: Error {
    case badURL(info: String)
}

protocol NetworKingProtocol {
    func composeURL(from host: String, scheme: String) -> URL?
    func getURL(from url: String) -> URL?
    func fetch(url: String) -> Future<Account, NetworkError>
}

protocol LocalDataProtocol {
    func fetchDataFromLocalFile(from file: String) -> [Account]
}

class NetworKing: LocalDataProtocol {
    func fetchDataFromLocalFile(from file: String) -> [Account] {
        guard let url = Bundle.main.url(forResource: file, withExtension: "json")
        else {fatalError("could not create the path")}

        guard let data = try? Data(contentsOf: url) else { fatalError("Couldnot read the file")}

        guard let accounts = try? JSONDecoder().decode([Account].self, from: data)
        else {fatalError("Could not decode data")}

        return accounts
    }
}

extension NetworKing: NetworKingProtocol {
    func composeURL(from host: String, scheme: String) -> URL? {
        return URL(string: "")
    }

    func getURL(from url: String) -> URL? {
        return URL(string: "")
    }

    func fetch(url: String) -> Future<Account, NetworkError> {
        return Future {_ in
        }
    }
}
