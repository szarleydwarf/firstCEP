//
//  CircularView.swift
//  SiftUI
//
//  Created by The App Experts on 06/05/2021.
//

import SwiftUI

struct CircularView: View {
    let account: Account
    @State var fill: CGFloat = 0.1
    var body: some View {
        ZStack {
//            Color(.green)
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
                    Rectangle().frame(width: 120, height: 120)
                    Filler(percent: Double(self.fill)/100)
                        .fill(Color.gray)
                        .frame(width: 120, height: 120)
                }
                .mask{
                    Image(systemName: ViewModel().imageName(kind: account.kind))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .padding(8)
                        .foregroundColor(.blue)
                }
                .onTapGesture {
                    
                }
            
            .padding(20)
        }
        .padding(10)
        .background(Color.green)
        .onTapGesture {
            self.fill += 0.1
        }
    }
}

struct CircularView_Previews: PreviewProvider {
    static var previews: some View {
        CircularView(account: Account.example)
    }
}
