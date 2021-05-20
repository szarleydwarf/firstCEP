//
//  MobiDetailsView.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 19/05/2021.
//

import SwiftUI

struct MobiDetailsView: View {
    let text: String

    var body: some View {
        Text(text)
    }
}

struct MobiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MobiDetailsView(text: "")
    }
}
