//
//  MobiRow.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 30/05/2021.
//

import SwiftUI

struct MobiRow: View {
    let vm = ViewModel()
    let mobi: Mobi
    let rgb: (Double, Double, Double)

    var body: some View {
        HStack {
            Image(systemName: vm.imageName(from: mobi.element))
                .foregroundColor(Color(red: rgb.0, green: rgb.1, blue: rgb.2))
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.red, lineWidth: 2))
            Text(mobi.name)
                .font(.title2)
        }
    }
}

struct MobiRow_Previews: PreviewProvider {
    static var previews: some View {
        MobiRow(mobi: Mobi.example, rgb: (0, 0, 0))
    }
}
