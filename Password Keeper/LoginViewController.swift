//
//  LoginViewController.swift
//  Password Keeper
//
//  Created by nmyren on 5/1/15.
//  Copyright (c) 2015 nmyren. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, passDataBack
{
    var username: String!
    var password: String!
    var newUsername : String!
    var newPassword : String!
    
    @IBOutlet var passTextField: UITextField!
    @IBOutlet var userTextField: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
       
        
    }
    @IBAction func Login(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var secondVC = (segue.destinationViewController as RegisterViewController)
        secondVC.delegate = self
        
    }
    
    func writeBack(name: String, pass: String)
    {
        username = name
        password = pass
      
    }
   
}

protocol passDataBack{
    func writeBack(name: String, pass: String)

}
