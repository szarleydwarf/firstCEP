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

    var body: some View {
        HStack {
            Image(systemName: vm.imageName(from: mobi.element))
                .foregroundColor(Color.green)
            Text(mobi.name)
                .font(.title2)
        }
    }
}

struct MobiRow_Previews: PreviewProvider {
    static var previews: some View {
        MobiRow(mobi: Mobi.example)
    }
}
