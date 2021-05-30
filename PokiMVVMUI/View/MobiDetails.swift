//
//  MobiDetails.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 30/05/2021.
//

import SwiftUI

struct MobiDetails: View {
    let mobi: Mobi
    let rgb: (Double, Double, Double)

    var body: some View {
        Text("\(mobi.name)")
    }
}

struct MobiDetails_Previews: PreviewProvider {
    static var previews: some View {
        MobiDetails(mobi: Mobi.example, rgb: (0, 0, 0))
    }
}
