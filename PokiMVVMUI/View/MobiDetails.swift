//
//  MobiDetails.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 30/05/2021.
//

import SwiftUI

struct MobiDetails: View {
    @EnvironmentObject var battle: Battle
    @State var showView = false
    let vm = ViewModel()
    let mobi: Mobi
    let rgb: RGB

    var body: some View {
        VStack {
            Image(systemName: vm.imageName(from: mobi.element))
                .resizable()
                .frame(width: 200, height: 200)
                .foregroundColor(Color(red: rgb.r, green: rgb.g, blue: rgb.b))
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.red, lineWidth: 2))
            Text(">>> \(mobi.name) <<<")
                .font(.title)
                .foregroundColor(Color(red: rgb.r, green: rgb.g, blue: rgb.b))
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
            Button("Add to battle") {
                battle.add(oponent: mobi)
                self.showView = true
            }
            .font(.title3)
            .padding(6)
            NavigationLink(destination: ContentView(), isActive: $showView) {}

            Spacer()
        }
        .navigationTitle("Mobie Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MobiDetails_Previews: PreviewProvider {
    static var previews: some View {
        MobiDetails(mobi: Mobi.example, rgb: RGB.example)
            .environmentObject(Battle())
    }
}
