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
print("Before")
        // add line till the percent met
        for i in 0...Int(percent) {
//            x position is either 0 or rect.width
            var x: CGFloat = 0//(i % 2) == 0 ?  0 : rect.width
//            y position is growing from 0 up to given percentage
            var y: CGFloat = (yOffset + 10)
            y = y > height ? yOffset : (yOffset + 10)
            print("i > \(i) > \(yOffset) > \(percent) > \(height) > \(y)")
            var pt = CGPoint(x: x, y: y)
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
