//
//  CircleButton.swift
//  Checkers
//
//  Created by Jeanie House on 2/22/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

import UIKit




class CircleButton: UIButton {

   
    override func drawRect(rect: CGRect) {
        
        
        self.layer.cornerRadius = 50 / 2
        self.layer.masksToBounds = true
        
        
        
        
        
    }
    

}
