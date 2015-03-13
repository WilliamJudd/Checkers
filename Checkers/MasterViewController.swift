//
//  MasterViewController.swift
//  Checkers
//
//  Created by Jeanie House on 2/21/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    
    @IBOutlet weak var aButton: UIButton!
    
    
    @IBOutlet weak var leaderImageView0: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aButton.setTitle("Leader", forState: .Normal)
        
        let leader = Leader(index:0)
        leaderImageView0.image = leader.icon
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            
            let DetailController = segue.destinationViewController as DetailViewController
            DetailController.leader = Leader(index:0)
            
        }
    }
    


}
