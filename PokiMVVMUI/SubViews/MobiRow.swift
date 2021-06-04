//
//  MobiRow.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 30/05/2021.
//

import SwiftUI

struct MobiRow: View {
    @EnvironmentObject var battle: Battle
    let vm = ViewModel()
    let mobi: Mobi
    let rgb: RGB

    var body: some View {
        HStack {
            Image(systemName: vm.imageName(from: mobi.element))
                .foregroundColor(Color(red: rgb.r, green: rgb.g, blue: rgb.b))
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.red, lineWidth: 2))
            Text(mobi.name)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(4)
        }
    }
}

struct MobiRow_Previews: PreviewProvider {
    static var previews: some View {
        MobiRow(mobi: Mobi.example, rgb: RGB.example)
            .environmentObject(Battle())
    }
}
