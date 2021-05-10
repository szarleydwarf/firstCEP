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
        let yOffset = CGFloat(1 - percent) * height

        // move to starting point
        path.move(to: CGPoint(x: 0, y: yOffset + height))

        // add line till the percent met
        for i in 0...Int(percent) {
            print("i > \(i) > \(percent)")
//            x position is either 0 or rect.width
            let x: CGFloat = (i % 2) == 0 ?  0 : rect.height
            print("X > \(i) > \(x)")
//            y position is growing from 0 up to given percentage
            let y: CGFloat = yOffset + height * CGFloat(i)
            print("Y > \(i) > \(y)")
            let pt = CGPoint(x: x, y: y)
            path.addLine(to: pt)
        }
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        return path
    }
}
