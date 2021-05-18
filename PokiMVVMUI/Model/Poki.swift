//
//  Poki.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 18/05/2021.
//

import Foundation

struct Poki: Decodable {
    let name: String
    let height, weight: Int
    
    #if DEBUG
    static var example = Poki(name: "", height: 0, weight: 0)
    #endif
}
