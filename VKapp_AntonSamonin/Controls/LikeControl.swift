//
//  LikeControl.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 10/10/18.
//  Copyright © 2018 AntCo. All rights reserved.
//

import UIKit

@IBDesignable class LikeControl: UIControl {

    private var label = UILabel.init()
    private var stack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stack.frame = bounds
    }
    
    private func setupView() {
        let button = LikeButton.init(type: .system)//кнопка
        button.setTitle("", for: [])
        button.addTarget(self,
                         action: #selector(onTap(_:)),
                         for: .touchUpInside)
        stack.addArrangedSubview(button)
        label.text = String(button.count)
        stack.addArrangedSubview(label)
        
        stack.spacing = 8
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        
        addSubview(stack)
    }
    
    @objc func onTap(_ button: LikeButton) {
        button.flipColor()    // см. LikeButton
        label.text = String(button.count)//обновляем лэйбл
    }
    }
    
  
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
