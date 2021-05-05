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
    let action: () 
    
    var body: some View {
        Button(action: {
            self.action
        }) {
            HStack {
                Text(buttonText)
                    .font(.title3)
                Image(systemName: imageName)
                    .padding(6)
            }
            .frame(width: 240, height: 40, alignment: .center)
            .foregroundColor(.white)
            .background(Color.green)
            .clipShape(Capsule())
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonText: "String", imageName: "String", action: Transfer().add(account: Account.example))
    }
}
