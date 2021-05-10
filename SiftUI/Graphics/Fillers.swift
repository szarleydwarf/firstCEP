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
        path.stroke(Color.red, lineWidth: 4)
        let height = rect.height
        let yOffset = CGFloat(1 - percent) * rect.height

        // move to starting point
        path.move(to: CGPoint(x: 0, y: yOffset + height))
/*
         Path { path in
             path.move(to: CGPoint(x: 10, y: 10))
             path.addLine(to: CGPoint(x: 100, y: 10))
             path.addLine(to: CGPoint(x: 100, y: 20))
             path.addLine(to: CGPoint(x: 10, y: 20))
         }
         .stroke(Color.blue, lineWidth: 10)
         */
        // add line till the percent met
        for i in 0...Int(percent) {
//            x position is either 0 or rect.width
            let x: CGFloat = true ?  0 : rect.width
//            y position is growing from 0 up to given percentage
            let y = 0//yOffset + height * CGFloat(i))
//            path.addLine(to: CGPoint(x: x, y: y))
        }
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        return path
    }
}
