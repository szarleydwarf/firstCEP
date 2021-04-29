//
//  ButtonView.swift
//  SiftUI
//
//  Created by The App Experts on 29/04/2021.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        HStack {
            Text("Send money")
                .font(.title3)
                .foregroundColor(.purple)
            Image(systemName: "arrowshape.turn.up.right.fill")
                .foregroundColor(.purple)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
