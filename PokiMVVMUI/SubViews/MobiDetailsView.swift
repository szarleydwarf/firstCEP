//
//  MobiDetailsView.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 19/05/2021.
//

import SwiftUI

struct MobiDetailsView: View {
    let text: String
    let fonts: Font
    let color: Color

    var body: some View {
        Text(text)
            .font(fonts)
            .foregroundColor(color)
    }
}

struct MobiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MobiDetailsView(text: "", fonts: .body, color: .black)
    }
}
