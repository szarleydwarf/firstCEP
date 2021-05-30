//
//  MobiDetails.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 30/05/2021.
//

import SwiftUI

struct MobiDetails: View {
    let vm = ViewModel()
    let mobi: Mobi
    let rgb: (Double, Double, Double)

    var body: some View {
        VStack {
            Image(systemName: vm.imageName(from: mobi.element))
                .resizable()
                .frame(width: 200, height: 200)
                .foregroundColor(Color(red: rgb.0, green: rgb.1, blue: rgb.2))
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.red, lineWidth: 2))
            Text(">>> \(mobi.name) <<<")
                .font(.title)
                .foregroundColor(Color(red: rgb.0, green: rgb.1, blue: rgb.2))
            Text(">>> \(mobi.element) <<<")
                .font(.title3)
            HStack {
                VStack {
                    Text("EXP > \(mobi.exp)")
                    Text("LIFE > \(mobi.life)")
                }
                .padding(16)
                .foregroundColor(.purple)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 2)
                )

                VStack {
                    Text("ATTACK > \(mobi.attack)")
                    Text("DEFENCE >\(mobi.defence)")
                }
                .padding(16)
                .foregroundColor(.red)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.red, lineWidth: 2)
                )

            }
            Spacer()
        }
        .navigationTitle("Mobie Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MobiDetails_Previews: PreviewProvider {
    static var previews: some View {
        MobiDetails(mobi: Mobi.example, rgb: (0, 0, 0))
    }
}
