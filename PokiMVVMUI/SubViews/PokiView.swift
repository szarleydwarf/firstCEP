//
//  PokiView.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 18/05/2021.
//

import SwiftUI

struct PokiView: View {
    let name: String

    var body: some View {
        HStack {
            MobiImageView(width: 20, height: 20)
                .position(x: 20, y: 20)
            MobiDetailsView(text: "Name - \(name)", fonts: .headline, color: .blue)
                .position(x: 0, y: 20)
        }
    }
}

struct PokiView_Previews: PreviewProvider {
    static var previews: some View {
        PokiView(name: "")
    }
}
