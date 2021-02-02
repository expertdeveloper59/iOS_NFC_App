//
//  HalfCircle.swift
//  Statis
//
//  Created by Fateh Khan on 02/02/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import SwiftUI

struct HalfCircle: View {
    let screenSize = UIScreen.main.bounds
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: screenSize.height))
            path.addCurve(to: CGPoint(x: screenSize.width, y: screenSize.height), control1: CGPoint(x: screenSize.width/2, y: screenSize.height/1.4), control2: .init(x: screenSize.width, y: screenSize.height))
            }
    }
}

struct TiltedCircle: View {
    let screenSize = UIScreen.main.bounds
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: -screenSize.width/4, y: screenSize.height/10))
            path.addCurve(to: CGPoint(x: screenSize.width+10, y: screenSize.height/12), control1: CGPoint(x: screenSize.width/3.2, y: screenSize.height/2.8), control2: .init(x: screenSize.width+10, y: screenSize.height/12))
            path.addLine(to: .init(x: screenSize.width, y: 0))
            path.addLine(to: .init(x: 0, y: 0))
            path.addLine(to: CGPoint(x: -screenSize.width/4, y: screenSize.height/10))
            }
        .fill(Color.gray)
    }
}

struct newArc: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let center:CGPoint = CGPoint(x: rect.midX,y: rect.midY)
    path.move(to: CGPoint(x: center.x + 64, y: center.y))
    path.addArc(center: center, radius: 64, startAngle: .degrees(0),   endAngle: .degrees(360), clockwise: false)
    return path
  }
}

struct HalfCircle_Previews: PreviewProvider {
    static var previews: some View {
        HalfCircle()
    }
}
