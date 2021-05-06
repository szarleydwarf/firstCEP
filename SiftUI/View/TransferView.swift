//
//  TransferView.swift
//  SiftUI
//
//  Created by The App Experts on 29/04/2021.
//

import SwiftUI

struct TransferView: View {
    let transfer: Transfer

    var body: some View {
        VStack {
            Text("FROM: ")
            Text(transfer.accounts.sender.kind ?? "DEFFF")
            Text("TO : ")
            Text(transfer.accounts.reciever.kind ?? "DEFFF")
//            ButtonView(buttonText: "Transfer", imageName: "paperplane.fill",
//                action: transfer.doTransfer(between: (transfer.accounts.sender, transfer.accounts.reciever)))
        }
    }
}

struct TransferView_Previews: PreviewProvider {
    static var previews: some View {
        TransferView(transfer: Transfer.example)
    }
}
