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
            Image(systemName: "arrowshape.turn.up.right.fill")
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.purple, lineWidth: 2))
                .padding(6)
        }
        .frame(width: 180, height: 40, alignment: .center)
        .foregroundColor(.purple)
        .background(Color.yellow)
        .clipShape(Capsule())
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
