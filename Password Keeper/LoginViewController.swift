//
//  LoginViewController.swift
//  Password Keeper
//
//  Created by nmyren on 5/1/15.
//  Copyright (c) 2015 nmyren. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController
{
    var username: String?
    var password: String?
    
    @IBAction func Login(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

   
}
