//
//  CircularView.swift
//  SiftUI
//
//  Created by The App Experts on 06/05/2021.
//

import SwiftUI

struct CircularView: View {
    @State var fill: CGFloat = 0.1
    var body: some View {
        ZStack {
//            Color(.green)
            ZStack {
                Circle()
                    .stroke(Color.white.opacity(0.3), lineWidth: 10.0)
                Circle()
                    .trim(from: 0, to: self.fill)
                    .stroke(Color.gray, lineWidth: 10.0)
                    .rotationEffect(.init(degrees: -90))
                    .animation(.linear)
            }
            .padding(20)
        }
        .padding(10)
        .background(Color.green)
        .onTapGesture {
            self.fill = 1.0
        }
    }
}

struct CircularView_Previews: PreviewProvider {
    static var previews: some View {
        CircularView()
    }
}
