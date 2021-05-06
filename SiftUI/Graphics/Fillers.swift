//
//  Fillers.swift
//  SiftUI
//
//  Created by The App Experts on 06/05/2021.
//

import SwiftUI

struct Filler: Shape {
    var percent: Double
    
     
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let fillHeight = 0.01 * rect.height
        path.move(to: CGPoint(x: 0, y: fillHeight * CGFloat(rect.height)))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        return path
    }
    
    
}
