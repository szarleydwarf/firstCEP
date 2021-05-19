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
    func fetchLocalFile(from fileName: String) -> [Poki]
}

class Services {
}

extension Services: LocalServicesProtocol {
    func fetchLocalFile(from fileName: String) -> [Poki] {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json")
        else {fatalError("could not create the path")}

        guard let data = try? Data(contentsOf: url) else { fatalError("Couldnot read the file")}

        guard let dataArray = try? JSONDecoder().decode([Poki].self, from: data)
        else {fatalError("Could not decode data")}

        return dataArray
    }
}
