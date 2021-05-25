//
//  AttackView.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 24/05/2021.
//

import SwiftUI

struct AttackView: View {
    let text: String
    var body: some View {
        Text(text)
    }
}

struct AttackView_Previews: PreviewProvider {
    static var previews: some View {
        AttackView(text: "")
    }
}
