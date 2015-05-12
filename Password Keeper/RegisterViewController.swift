//
//  RegisterViewController.swift
//  Password Keeper
//
//  Created by blowery on 5/4/15.
//  Copyright (c) 2015 nmyren. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController
{
    var oldPassword : String!
    
    @IBOutlet var usernameTextfield: UITextField!
    
    @IBOutlet var passwordTextfield: UITextField!
    
    var delegate: passDataBack?
    
    override func viewDidLoad()
        
    {
        usernameTextfield.backgroundColor = UIColor.blackColor()
        passwordTextfield.backgroundColor = UIColor.blackColor()
        self.view.backgroundColor = UIColor.darkGrayColor()
        super.viewDidLoad()

       
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
       
    }
    
 

    @IBAction func register(sender: AnyObject)
    {
        delegate?.writeBack(usernameTextfield.text, pass: passwordTextfield.text)
        self.navigationController?.popViewControllerAnimated(true)
    
    }
    
   
    
  
    
   
}
