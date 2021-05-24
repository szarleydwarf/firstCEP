//
//  PokiDetailsView.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 20/05/2021.
//

import SwiftUI

struct PokiDetailsView: View {
    @StateObject private var vm = ViewModel()
    @State var selected: Poki = Poki.example
    let mobi: Poki

    var body: some View {
        VStack {
            MobiImageView(imageName: self.vm.imageName(from: mobi.element), width: 140, height: 140)
            MobiDetailsView(text: "Name - \(mobi.name)", fonts: .title, color: .blue)
            MobiDetailsView(text: "Element - \(mobi.element)", fonts: .title2, color: .green)
            HStack {
                MobiDetailsView(text: "Attack - \(mobi.attack)", fonts: .headline, color: .red)
                MobiDetailsView(text: "Defence - \(mobi.defence)", fonts: .headline, color: .orange)
            }
            HStack {
                MobiDetailsView(text: "Life - \(mobi.life)", fonts: .headline, color: .red)
                MobiDetailsView(text: "Experience - \(mobi.exp)", fonts: .headline, color: .orange)
            }
            Picker("", selection: $selected) {
                ForEach(self.vm.pokis, id: \.self) {poki in
                    PokiView(name: poki.name, element: poki.element)
                }
            }
            .onAppear(perform: self.vm.fetchPokiList)
            .frame(width: 200, height: 120, alignment: .center)

            ButtonView(text: "To the battle")
        }
        Spacer()
    }
}

struct PokiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokiDetailsView(mobi: Poki.example)
    }
}
