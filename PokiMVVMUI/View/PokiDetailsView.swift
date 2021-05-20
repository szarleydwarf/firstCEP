//
//  PokiDetailsView.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 20/05/2021.
//

import SwiftUI

struct PokiDetailsView: View {

    var body: some View {
        MobiImageView(width: 200, height: 200)
        MobiDetailsView(name: "", showAll: true)
    }
}

struct PokiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokiDetailsView()
    }
}
