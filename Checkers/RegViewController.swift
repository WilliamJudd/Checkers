//
//  RegViewController.swift
//  Checkers
//
//  Created by Jeanie House on 2/18/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

import UIKit

class RegViewController: UIViewController {

    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBOutlet weak var buttonBottomConstraint: NSLayoutConstraint!
    
    @IBAction func cancel(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(Bool(), completion:nil)
    }
    
    
    @IBAction func register(sender: AnyObject) {
        
        
        if let token = User.currentUser().token {
            
            println(token)
            
        }else{
            
            User.currentUser().getUserToken(emailField.text, password: passwordField.text)
            
        
        let username = usernameField.text;
        let userEmail = emailField.text;
        let userPassword = passwordField.text;
        
        
   
        
      
        
       
    }
    func displayMyAlertMessage(userMessage:String){
        
        var myAlert = UIAlertController(title: "Invalid", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
        
    }
    
    
        
            
    
    }
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
      

        
        NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillShowNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
            
            var kbSize = notification.userInfo?[UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size
            
            self.buttonBottomConstraint.constant = 20 + kbSize!.height
            
            
            
            self.view.layoutIfNeeded()
            
        }
        
        
        NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillHideNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
            
            
            self.buttonBottomConstraint.constant = 20
            
            
            self.view.layoutIfNeeded()
            
        }


      
    }
    
    
       
    
    func signUp() {
        
        var user = User()
        user.token = usernameField.text
        user.token = emailField.text
        user.token = passwordField.text
        
        
        
    }
            
        

        

    
    
}//END
