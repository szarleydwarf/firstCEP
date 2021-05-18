//
//  PokiView.swift
//  PokiMVVMUI
//
//  Created by The App Experts on 18/05/2021.
//

import SwiftUI

struct PokiView: View {
    let name: String
    let height, weight: Int
    
    var body: some View {
        VStack{
            ZStack {
                Capsule()
                    .frame(width: 200, height: 66, alignment: .center)
                Text(name)
                    .font(.title)
                    .foregroundColor(.blue)
            }
            Text("Height - \(height)")
                .font(.headline)
                .foregroundColor(.green)
            Text("Weight - \(weight)")
                .font(.headline)
                .foregroundColor(.green)
        }
    }
}

struct PokiView_Previews: PreviewProvider {
    static var previews: some View {
        PokiView(name: "POKI", height: 10, weight: 10)
    }
}
