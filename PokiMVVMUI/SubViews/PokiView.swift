//
//  PokiView.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 18/05/2021.
//

import SwiftUI

struct PokiView: View {
    @StateObject private var vm = ViewModel()
    let name, element: String

    var body: some View {
        HStack {
            MobiImageView(imageName: self.vm.imageName(from: element), width: 30, height: 30)
                .position(x: 20, y: 20)
            MobiDetailsView(text: "Name - \(name)", fonts: .headline, color: .blue)
                .position(x: 0, y: 20)
        }
    }
}

struct PokiView_Previews: PreviewProvider {
    static var previews: some View {
        PokiView(name: "", element: "")
    }
}
