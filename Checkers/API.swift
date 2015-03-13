//
//  API.swift
//  RailsRequest
//
//  Created by Jeanie House on 2/17/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

import Foundation

let API_URL = "https://warm-spire-6158.herokuapp.com/"

typealias ResponseBlock = (responseInfo: [String:AnyObject]) -> ()

class APIRequest {
    
    // (responseInfo: [String:AnyObject]) -> ()
    
    class func requestWithEndpoint(endpoint: String, method: String, completion: ResponseBlock) {
        
        var options = [
            
            "endpoint" : endpoint,
            "method" : method,
            "body" : [
      //          "user" : ["auth_token" : User.currentUser().token!]
                "auth_token" : [User.currentUser().token!]
            ]
            
            ] as [String: AnyObject]
        
        requestWithOptions(options, andCompletion: completion)
        
        
        
    }
    
    class func requestWithOptions(options: [String: AnyObject], andCompletion completion: ResponseBlock) {


        var url = NSURL(string: API_URL + (options["endpoint"] as String))
        var request = NSMutableURLRequest(URL: url!)

        request.HTTPMethod = options["method"] as String

        ////BODY

        let bodyInfo = options["body"] as [String:AnyObject]

        let requestData = NSJSONSerialization.dataWithJSONObject(bodyInfo, options: NSJSONWritingOptions.allZeros, error: nil)
        let jsonString = NSString(data: requestData!, encoding: NSUTF8StringEncoding)
        let postLength = "\(jsonString!.length)"

        request.setValue(postLength, forHTTPHeaderField: "Content-Length")
        let postData = jsonString?.dataUsingEncoding(NSASCIIStringEncoding, allowLossyConversion: true)

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.HTTPBody = postData

        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in

            if error == nil {

                //do something with data

                if let json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: nil) as? [String:AnyObject] {
                    
                    completion(responseInfo: json)
                    
                } else {
                    
                //    println("no json")
                    
                }


            }else{

            //    println(error)



         }

      }



    }

}



private let _currentUser = User()

class User {
    
    

    var token: String? {

        didSet {

            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(token, forKey: "token")
            defaults.synchronize()

        }


    }

    init() {

         let defaults = NSUserDefaults.standardUserDefaults()
         token = defaults.objectForKey("token") as? String

        println(token)

    }

    class func currentUser() -> User { return _currentUser }


    
    func getUserToken(username: String, password: String) {
        
        // sign up
        
        let options: [String:AnyObject] = [
            
            "endpoint" : "users",
            "method" : "POST",
            "body" : [
                
                "user" : [ "email" : username, "password" : password]
                
                
            ]
            
            
        ]
        
        APIRequest.requestWithOptions(options, andCompletion: { (responseInfo) -> () in
            
        //    println(responseInfo)
            
            let dataInfo = responseInfo["user"] as [String:String]
            self.token = dataInfo["authentication_token"]
            
            
            // do something here after the request is done
            
        })
        
        
        
    }
    
    func loginToken(username: String, password: String) {
        
        // login
        
        let options: [String:AnyObject] = [
            
            "endpoint" : "users/sign_in",
            "method" : "POST",
            "body" : [
                
                "user" : [ "email" : username, "password" : password]
                
                
            ]
            
            
        ]
        
        APIRequest.requestWithOptions(options, andCompletion: { (responseInfo) -> () in
            
        //    println(responseInfo)
            
            let dataInfo = responseInfo["user"] as [String:String]
            self.token = dataInfo["authentication_token"]
            
            
            // do something here after the request is done
            
        })
        
        
        
    }
  

    func getLeaderboard(username: String, password: String) {
        
        // sign up
        
        let options: [String:AnyObject] = [
            
            "endpoint" : "leaderboard",
            "method" : "Get",
            "body" : [
                
                "leaderboard" : [ "" ]
                
                
            ]
            
            
        ]
        
        APIRequest.requestWithOptions(options, andCompletion: { (responseInfo) -> () in
            
            //    println(responseInfo)
            
            let dataInfo = responseInfo["user"] as [String:String]
            self.token = dataInfo["authentication_token"]
            
            
            // do something here after the request is done
            
        })
        
        
        
    }
    
  
        
        
    


}//END
