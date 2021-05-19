//
//  MobiImageView.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 19/05/2021.
//

import SwiftUI

struct MobiImageView: View {
    var body: some View {
        ZStack {
            Circle()
            Image(systemName: "lock")
                .foregroundColor(Color.white)
        }
    }
}

struct MobiImageView_Previews: PreviewProvider {
    static var previews: some View {
        MobiImageView()
    }
}
