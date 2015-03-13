//
//  Leaders.swift
//  Checkers
//
//  Created by Jeanie House on 2/21/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

import Foundation
import UIKit

struct Leader {
    
    var title: String?
    var description: String?
    var icon: UIImage?
   
    var opponents: [String] = []
    var backgroundColor: UIColor = UIColor.clearColor()
    
    init(index: Int) {
        
        let infoLibrary = Info().library
        let leaderDictionary = infoLibrary[index]
        
        title = leaderDictionary["title"] as String!
        
        description = leaderDictionary["description"] as String!
        
        let iconName = leaderDictionary["icon"] as String!
        
        icon = UIImage(named: iconName)
        
       
        
   //     opponents = leaderDictionary["opponents"] as String!
        
        let colorsDictionary = leaderDictionary["backgroundColor"] as [String: CGFloat]
        
        backgroundColor = rgbColorFromDictionary(colorsDictionary)
        
        
    }
    
    func rgbColorFromDictionary(colorDictionary: [String: CGFloat]) -> UIColor {
        
        let red = colorDictionary["red"]!
        let green = colorDictionary["green"]!
        let blue = colorDictionary["blue"]!
        let alpha = colorDictionary["alpha"]!
        
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha:alpha)
        
        
    }
}