//
//  CircularView.swift
//  SiftUI
//
//  Created by The App Experts on 06/05/2021.
//

import SwiftUI

struct CircularView: View {
    let account: Account
    let imageSize: CGFloat = 200
    @State var fill: CGFloat = 0.1
    var body: some View {
        ZStack {
            ZStack {
                Circle()
                    .stroke(Color.white.opacity(0.3), lineWidth: 10.0)
                Circle()
                    .trim(from: 0, to: self.fill)
                    .stroke(Color.blue, lineWidth: 10.0)
                    .rotationEffect(.init(degrees: -90))
                    .animation(.linear)
            }

            ZStack(alignment: .center) {
                Rectangle().frame(width: self.imageSize, height: self.imageSize)
                Filler(percent: Double(self.fill))
                    .fill(Color.yellow)
                    .frame(width: self.imageSize, height: self.imageSize)
            }
            .mask(
                Image.init(systemName: ViewModel().imageName(kind: account.kind))
                    .resizable()
                    .frame(width: self.imageSize, height: self.imageSize)
            )
        }
        .onTapGesture {
            if self.fill >= 1 {
                self.fill = 0
            } else {
                self.fill += 0.05
            }
        }
        .padding(20)
        .background(Color.green)
    }
}

struct CircularView_Previews: PreviewProvider {
    static var previews: some View {
        CircularView(account: Account.example)
    }
}
