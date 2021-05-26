//
//  Services.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 19/05/2021.
//

import Foundation

enum ServiceErrors: Error {
    case badURL(message: String)
}

protocol LocalServicesProtocol {
    func fetchLocalFile<T: Decodable>(_type: T.Type, from fileName: String) -> T
}

class Services {
}

extension Services: LocalServicesProtocol {
    func fetchLocalFile<T: Decodable>(_type: T.Type, from fileName: String) -> T {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json")
        else {fatalError("could not find \(fileName)")}

        guard let data = try? Data(contentsOf: url) else { fatalError("Couldnot read the file \(fileName)")}

        guard let dataArray = try? JSONDecoder().decode(T.self, from: data)
        else {fatalError("Could not decode data from \(fileName)")}

        return dataArray
    }
}
