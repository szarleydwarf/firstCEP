//
//  ButtonView.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 21/05/2021.
//

import SwiftUI

struct ButtonView: View {
    let text: String

    var body: some View {
            VStack {
                Text(text)
                .frame(width: 240, height: 40, alignment: .center)
                .foregroundColor(.white)
                .background(Color.green)
                .clipShape(Capsule())
            }
        }

}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "")
    }
}
