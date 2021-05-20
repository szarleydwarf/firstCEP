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
            Circle()
                .stroke(Color.gray, lineWidth: 2)
            Image(systemName: "lock")
                .resizable()
                .frame(width: width, height: height)
                .foregroundColor(Color.green)
        }
    }
}

struct MobiImageView_Previews: PreviewProvider {
    static var previews: some View {
        MobiImageView(width: 0, height: 0)
    }
}
