//
//  MatchCell.swift
//  Checkers
//
//  Created by Jeanie House on 2/18/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

import UIKit

class MatchCell: UITableViewCell {
    
    var checkerFace = CheckerFace()
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
        checkerFace.frame = CGRect(x: 300, y: 20, width: 30, height: 30)
        checkerFace.backgroundColor = UIColor.clearColor()
        
        self.addSubview(checkerFace)
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
