//
//  DismissSeque.swift
//  Checkers
//
//  Created by Jeanie House on 2/18/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

import UIKit

class DismissSeque: UIStoryboardSegue {
   
    
    override func perform() {
        if let controller = sourceViewController.presentingViewController? {
            controller.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    
    
}
