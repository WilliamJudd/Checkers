//
//  CheckerFace.swift
//  Checkers
//
//  Created by William Judd on 2/19/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

import UIKit

var context = UIGraphicsGetCurrentContext();

class CheckerFace: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
      
        UIColor.blackColor().set()
        CGContextAddArc(context, (frame.size.width)/2, frame.size.height/2, (frame.size.width - 10)/2, 0.0, CGFloat(M_PI * 2.0), 1)
        CGContextFillPath(context);
    
    }
    

}

