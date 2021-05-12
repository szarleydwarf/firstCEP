//
//  TransferView.swift
//  SiftUI
//
//  Created by The App Experts on 29/04/2021.
//

import SwiftUI

struct TransferView: View {
    let transfer: Transfer
    let imageSize: CGFloat = 200
    @State var percent: CGFloat = 0

    var body: some View {
        VStack {
            ZStack(alignment: .center) {
                Rectangle().frame(width: self.imageSize, height: self.imageSize)
                Filler(percent: Double(self.percent))
                    .fill(Color.yellow)
                    .frame(width: self.imageSize, height: self.imageSize)
            }
            .mask(
                Image.init(systemName: ViewModel().imageName(kind: "folder"))
        // "account.kind"))
                    .resizable()
                    .frame(width: self.imageSize, height: self.imageSize)
            )
            .background(Color.green)
            .animation(.linear)

            Text("FROM: ")
            Text(transfer.accounts.sender.kind ?? "DEFFF")
            Text("TO : ")
            Text(transfer.accounts.reciever.kind ?? "DEFFF")
//            ButtonView(buttonText: "Transfer", imageName: "paperplane.fill",
//                action: transfer.doTransfer(between: (transfer.accounts.sender, transfer.accounts.reciever)))
        }
        .onTapGesture {
            if self.percent >= 100 {
                self.percent = 0
            } else {
                self.percent += 10
            }
        }
    }
}

struct TransferView_Previews: PreviewProvider {
    static var previews: some View {
        TransferView(transfer: Transfer.example)
    }
}
