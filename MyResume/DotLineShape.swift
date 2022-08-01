//
//  DotLineShape.swift
//  MyResume
//
//  Created by TBCASoft-Bennett on 2022/8/1.
//

import SwiftUI

struct DotLineShape: Shape {
    
    enum LineStyle{ case topHalf, full, bottomHalf }
    
    
    var lineWidth: CGFloat = 10
    var dotSize: CGFloat = 30
    var style: LineStyle = .full
    var dotYPosition: CGFloat {
        switch style {
        case .topHalf:
            return 0.2
        case .full:
            return 0.5
        case .bottomHalf:
            return 0.8
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addEllipse(in: CGRect(x: rect.midX - (dotSize * 0.5),
                                   y: rect.maxY * dotYPosition,
                                   width: dotSize,
                                   height: dotSize))
        
        path.addRect(CGRect(x: rect.midX - (lineWidth * 0.5),
                            y: style == .topHalf ? rect.maxY * 0.2 : rect.minY,
                            width: lineWidth,
                            height: style == .full ? rect.height : rect.height * 0.8))
        
        return path
    }
}

struct DotLineShape_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0){
            DotLineShape(style: .topHalf).background(.yellow)
            DotLineShape().background(.blue)
            DotLineShape(style: .bottomHalf).background(.yellow)
        }
    }
}
