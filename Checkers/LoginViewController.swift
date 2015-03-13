//
//  LoginViewController.swift
//  Checkers
//
//  Created by Jeanie House on 2/18/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBOutlet weak var buttonBottomConstraint: NSLayoutConstraint!
    
    @IBAction func cancel(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(Bool(), completion: nil)
    }
    
    @IBAction func login(sender: AnyObject) {
        
        if let token = User.currentUser().token {
            
            println(token)
            
        }else{
            
            User.currentUser().getUserToken(emailField.text, password: passwordField.text)
            
            
            
        }
        
        

        
        let email = emailField.text;
        let userPassword = passwordField.text;
        
        if(email.isEmpty || userPassword.isEmpty)
            
        {
            
            displayMyAlertMessage("All fields are required")
            
            return
            
        }
        
    }
    
    
    
    
    
    
    func displayMyAlertMessage(userMessage:String){
        
        var myAlert = UIAlertController(title: "Invalid", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
        
    
    
    
    
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
    

}
