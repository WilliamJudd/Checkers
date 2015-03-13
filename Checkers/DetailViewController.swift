//
//  DetailViewController.swift
//  Checkers
//
//  Created by Jeanie House on 2/21/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var leaderCoverImage: UIImageView!
    
    @IBOutlet weak var leaderTitle: UILabel!
    
    @IBOutlet weak var leaderDescription: UILabel!
    
    @IBOutlet weak var leaderOpponents: UILabel!
    var leader: Leader?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if leader != nil {
            
            leaderCoverImage.image = leader!.icon
            leaderCoverImage.backgroundColor = leader!.backgroundColor
            leaderTitle.text = leader!.title
            leaderTitle.textColor = UIColor .whiteColor()
            leaderDescription.text = leader!.description
            leaderDescription.textColor = UIColor.whiteColor()
         //   leaderOpponents.text = leader!.opponents
            
            
            
        }
        
        // Do any additional setup after loading the vie
        
    }
    
    
    
    @IBAction func cancel(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(Bool(true), completion:nil)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    }

