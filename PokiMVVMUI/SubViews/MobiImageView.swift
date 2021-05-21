//
//  MobiImageView.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 19/05/2021.
//

import SwiftUI

struct MobiImageView: View {
    let imageName: String
    let width, height: CGFloat

    var body: some View {
        ZStack {
            Image(systemName: imageName)
                .resizable()
                .frame(width: width/1.1, height: height/1.1)
                .foregroundColor(Color.green)
                .clipShape(Circle())
            Circle()
                .stroke(Color.gray, lineWidth: 3)
                .frame(width: width, height: height, alignment: .center)
        }
    }
}

struct MobiImageView_Previews: PreviewProvider {
    static var previews: some View {
        MobiImageView(imageName: "", width: 0, height: 0)
    }
}
