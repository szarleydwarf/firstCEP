//
//  GoalView.swift
//  SiftUI
//
//  Created by The App Experts on 12/05/2021.
//

import SwiftUI
import Combine

struct GoalView: View {
    @State private var goal: String = ""

    var body: some View {
        VStack(alignment: .center) {
            Text("What is your money Goal for this account")
            TextField("Enter $$$ Goal", text: $goal)
                .keyboardType(.decimalPad)
                .padding(40)
                .onReceive(Just(self.goal)) { (input) in
                    let filtered = input.filter { $0.isNumber }
                    if self.goal != filtered {
                        self.goal = filtered
                    }
                }
            Text("You enter")
            Text(goal)
        }
        .padding(20)
        .background(Color.green)
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView()
    }
}
