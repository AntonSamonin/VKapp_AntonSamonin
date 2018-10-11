//
//  AvatarView.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 10/9/18.
//  Copyright © 2018 AntCo. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class AvatarView: UIView {
    
    var image: UIImage? = UIImage() {
        willSet {
            imageView.image? = newValue!
        }
    }
    var imageView = UIImageView()
    
    
    @IBInspectable var shadowColor: UIColor = UIColor.black {
        didSet {
            changeShadowColor()
        }
    }
   
    
    @IBInspectable var shadowOpacity: Float = 0.8 {
        didSet {
            changeShadowOpacity()
        }
    }
   
    
    @IBInspectable var shadowRadius: CGFloat = 20 {
        didSet {
        changeShadowRadius()
        }
    }
    
    
    
    @IBInspectable var shadowOffSet: CGSize = .zero {
        didSet {
            changeShadowOffSet()
        }
    }
    private func changeShadowOffSet() {
        self.layer.shadowOffset = self.shadowOffSet
    }
   
    private func changeShadowColor() {
        self.layer.shadowColor = self.shadowColor.cgColor
    }
    
    private func changeShadowOpacity() {
        self.layer.shadowOpacity = self.shadowOpacity
    }
    
    
    private func changeShadowRadius() {
        self.layer.shadowRadius = self.shadowRadius
    }
    
    
    func shadow() {
        self.changeShadowColor()
        self.changeShadowOffSet()
        self.changeShadowRadius()
        self.changeShadowOpacity()
    }
    
    private func setImage() {
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height))
        imageView.image = self.image
        let roundMask = CAShapeLayer()
        let round = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height))
        roundMask.path = round.cgPath
        imageView.layer.mask = roundMask
        imageView.contentMode = .scaleAspectFill
        self.addSubview(imageView)
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.layer.bounds.height/2
        self.contentMode = UIView.ContentMode.scaleAspectFill
        self.shadow()
        self.setImage()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.layer.bounds.height/2
        self.contentMode = UIView.ContentMode.scaleAspectFill
        self.shadow()
        self.setImage()
    }
    
}
