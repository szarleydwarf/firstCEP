//
//  Fillers.swift
//  SiftUI
//
//  Created by The App Experts on 06/05/2021.
//

import SwiftUI

struct Filler: Shape {
    var percent: Double

    var animatableData: Double {
        get { percent }
        set { percent = Double(newValue)}
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let height = rect.height
        let yOffset = CGFloat(1 - percent) * rect.height

        // move to starting point
        path.move(to: CGPoint(x: 0, y: yOffset + height))

        // add line till the percent met
        for i in 0...Int(percent) {
            let x = CGFloat(i) * rect.width
            path.addLine(to: CGPoint(x: x, y: yOffset + height * CGFloat(i)))
        }
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        return path
    }
}
