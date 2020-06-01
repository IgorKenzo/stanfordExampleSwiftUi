//
//  Pie.swift
//  TesteSwiftUI
//
//  Created by Igor Kenzo Miyamoto Dias on 01/06/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SwiftUI

struct Pie: Shape {
    var startAngle : Angle
    var endAngle : Angle
    var clockwise : Bool = false
    
    func path(in rect: CGRect) -> Path {
        let centerRect = CGPoint(x: rect.midX, y: rect.midY)
        let radiusRect = min(rect.width, rect.height)/2
        let start =  CGPoint (
                x: centerRect.x + radiusRect * cos(CGFloat(startAngle.radians)),
                y: centerRect.y + radiusRect * sin(CGFloat(startAngle.radians))
        )
        var p = Path()
        
        p.move(to: centerRect)
        p.addLine(to: start)
        p.addArc(center: centerRect, radius: radiusRect, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        
        return p
    }
}
