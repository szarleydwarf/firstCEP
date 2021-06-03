//
//  RGB.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 03/06/2021.
//

import Foundation

struct RGB {
    let r, g, b: Double

    #if DEBUG
    static var example = RGB(r: 0, g: 0, b: 0)
    #endif
}
