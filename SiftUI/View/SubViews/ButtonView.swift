//
//  ButtonView.swift
//  SiftUI
//
//  Created by The App Experts on 29/04/2021.
//

import SwiftUI

struct ButtonView: View {
    let buttonText:String
    let imageName:String
    
    var body: some View {
        HStack {
            Text(buttonText)
                .font(.title3)
            Image(systemName: imageName)
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
        ButtonView(buttonText: String, imageName: String)
    }
}
