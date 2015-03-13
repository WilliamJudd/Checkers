//
//  StartViewController.swift
//  Checkers
//
//  Created by Jeanie House on 2/18/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

import UIKit



class StartViewController: UIViewController {

    
    
    
    
    
    
    
    @IBOutlet weak var redButton: CircleButton!
    
    @IBOutlet weak var yellowButton: CircleButton!
    
    
    @IBOutlet weak var greenButton: CircleButton!
    
    @IBOutlet weak var blueButton: CircleButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataModel.mainData().currentGame = GameModel()
     
        redButton.backgroundColor = UIColor.redColor()
        yellowButton.backgroundColor = UIColor.yellowColor()
        greenButton.backgroundColor = UIColor.greenColor()
        blueButton.backgroundColor = UIColor.blueColor()
        
        
    }

    
    @IBAction func redButtonPressed(sender: AnyObject) {
        
        DataModel.mainData().currentGame?.buttonColor = UIColor.redColor()
        
        
    }
    
    @IBAction func yellowButtonPressed(sender: AnyObject) {
        
        DataModel.mainData().currentGame?.buttonColor = UIColor.yellowColor()
        
        
    }
  
    @IBAction func greenButtonPressed(sender: AnyObject) {
        
        DataModel.mainData().currentGame?.buttonColor = UIColor.greenColor()
        
        
    }
    
    @IBAction func blueButtonPressed(sender: AnyObject) {
        
        DataModel.mainData().currentGame?.buttonColor = UIColor.blueColor()
        
        
    }
    
    
    
    
    
    override func viewDidAppear(animated: Bool) {
        
        
        if User.currentUser().token == nil {
            
            var loginVC = storyboard?.instantiateViewControllerWithIdentifier("loginVC") as ViewController
            
            presentViewController(loginVC, animated: false, completion: nil)
            
          //  println(User.currentUser().token)
            
            
        }
    }
    
    
    @IBAction func createGame(sender: AnyObject) {
        
    APIRequest.requestWithEndpoint("games/create", method: "POST") { (responseInfo) -> () in
        
        println(responseInfo)
        
        }
  
    
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
