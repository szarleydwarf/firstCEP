//
//  MobiImageView.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 19/05/2021.
//

import SwiftUI

struct MobiImageView: View {
    let width, height: CGFloat

    var body: some View {
        ZStack {
            Image(systemName: "lock")
                .resizable()
                .frame(width: width/2, height: height/2)
                .foregroundColor(Color.green)
            Circle()
                .stroke(Color.gray, lineWidth: 3)
                .frame(width: width, height: height, alignment: .center)
        }
    }
}

struct MobiImageView_Previews: PreviewProvider {
    static var previews: some View {
        MobiImageView(width: 0, height: 0)
    }
}
