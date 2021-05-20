//
//  PokiDetailsView.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 20/05/2021.
//

import SwiftUI

struct PokiDetailsView: View {
    let mobi: Poki

    var body: some View {
        VStack {
            MobiImageView(width: 140, height: 140)
            MobiDetailsView(text: "Name - \(mobi.name)")
            MobiDetailsView(text: "Element - \(mobi.element)")
            MobiDetailsView(text: "Attack - \(mobi.attack)")
            MobiDetailsView(text: "Defence - \(mobi.defence)")
            MobiDetailsView(text: "Experience - \(mobi.exp)")
            MobiDetailsView(text: "Life - \(mobi.life)")
        }
    }
}

struct PokiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokiDetailsView(mobi: Poki.example)
    }
}
