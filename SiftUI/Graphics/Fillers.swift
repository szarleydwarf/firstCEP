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
        let yOffset = CGFloat(1 - percent / 100) * (rect.height)

        // move to starting point
        path.move(to: CGPoint(x: 0, y: yOffset + height))

        // add line till the percent met
        for _ in 0...Int(percent) {
            //            y position is growing from height up to given percentage
            let y: CGFloat = yOffset
            var pt = CGPoint(x: 0, y: y)
            //            x position is either 0 or rect.width
            path.addLine(to: pt)
            pt = CGPoint(x: rect.width, y: y)
            path.addLine(to: pt)
        }
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        return path
    }
}
