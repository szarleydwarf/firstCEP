//
//  GoalView.swift
//  SiftUI
//
//  Created by The App Experts on 12/05/2021.
//

import SwiftUI
import Combine

struct GoalView: View {
    @Binding var account: Account
    @State var goalString: String = ""

    var body: some View {
        VStack(alignment: .center) {
            Text("What is your money Goal for this account")
            TextField("Enter $$$ Goal", text: $goalString)
                .keyboardType(.decimalPad)
                .padding(3)
                .background(Color.white)
                .clipShape(Capsule())
                .lineLimit(1)
                .multilineTextAlignment(.center)
                .onReceive(Just(self.goalString)) { (input) in
                    let filtered = input.filter { $0.isWholeNumber }
                    if self.goalString != filtered {
                        self.account.goal = Double(filtered) ?? 0
                    }
                }
            Text("You enter")
            Text("\(self.account.goal ?? 0)")
        }
        .padding(20)
        .background(Color.green)
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView(account: .constant(Account.example))
    }
}
