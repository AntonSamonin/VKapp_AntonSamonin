//
//  LikeButton.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 10/10/18.
//  Copyright © 2018 AntCo. All rights reserved.
//

import UIKit

class LikeButton: UIButton {

    let path = UIBezierPath()
    var count = 0
    let buttonColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
    var liked = false
    
    
    

    override func draw(_ rect: CGRect) {
    drawHeartShape()
    }
    
    func drawHeartShape() {
        
        let frameWidht = self.frame.size.width
        let frameHeight = self.frame.size.height
        
        let a = frameWidht * 0.4
        let b = frameHeight * 0.3
        let radius: CGFloat = sqrt(a*a + b*b)/2
        path.addArc(withCenter: CGPoint(x: frameWidht * 0.3, y: frameHeight * 0.35), radius: radius, startAngle: CGFloat(135).toRadians, endAngle: CGFloat(315).toRadians, clockwise: true)
        //провал в центре - возможно, лучше без него?..
        path.addLine(to: CGPoint(x: frameWidht / 2, y: frameHeight * 0.2))
        //правая дуга
        path.addArc(withCenter: CGPoint(x: frameWidht * 0.7, y: frameHeight * 0.35), radius: radius, startAngle: CGFloat(225).toRadians, endAngle: CGFloat(45).toRadians, clockwise: true)
        //низ
        //справа
        path.addLine(to: CGPoint(x: frameWidht * 0.5, y: frameHeight * 0.95))
        //слева
        path.addLine(to: CGPoint(x: frameWidht * 0.1, y: frameHeight * 0.5))
        path.close()
        
        buttonColor.setStroke()
        path.stroke()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        self.layer.mask = shapeLayer
    }
    
    func flipColor() {
        if !liked {    //проверяем
            self.backgroundColor = buttonColor //цвет если лайкнули
            count += 1
            liked = !liked //обновили контрольное значение
            
        } else {
            self.backgroundColor = .white
            count -= 1
            liked = !liked
        }
    }
}

//переводим из градусов и назад
extension FloatingPoint {
    var toRadians: Self { return self * .pi / 180 }
    var toDegrees: Self { return self * 180 / .pi }
}

