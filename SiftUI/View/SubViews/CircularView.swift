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
    @State var fill: CGFloat = 0

    var body: some View {
        ZStack {
            ZStack {
                Circle()
                    .stroke(Color.white.opacity(0.3), lineWidth: 10.0)
                Circle()
                    .trim(from: 0, to: self.fill/100)
                    .stroke(Color.blue, lineWidth: 10.0)
                    .rotationEffect(.init(degrees: -90))
                    .animation(.linear)
            }

            ZStack(alignment: .center) {
                VStack {
                    Text(account.currency ?? "")
                    Text("\(account.balance ?? 0)")
                    Text("Goal: \(account.goal ?? 0)")
                        .foregroundColor(.red)
                }
                .font(.title)
                .foregroundColor(.white)
            }
       }
        .onTapGesture {
            if self.fill >= 100 {
                self.fill = 0
            } else {
                self.fill += 10
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
