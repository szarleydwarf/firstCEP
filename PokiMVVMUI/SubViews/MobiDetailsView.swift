//
//  MobiDetailsView.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 19/05/2021.
//

import SwiftUI

struct MobiDetailsView: View {
    let name: String

    var body: some View {
        Text("Name - \(name)")
    }
}

struct MobiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MobiDetailsView(name: "")
    }
}
