//
//  RegisterViewController.swift
//  Password Keeper
//
//  Created by blowery on 5/4/15.
//  Copyright (c) 2015 nmyren. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate
{
    var oldPassword : String?
    
    @IBOutlet var OldPassTextfield: UITextField!
    
    @IBOutlet var passwordTextfield: UITextField!
    
    var delegate: passDataBack?
    
    override func viewDidLoad()
        
    {
        

        OldPassTextfield.backgroundColor = UIColor.blackColor()
        OldPassTextfield.delegate = self
        passwordTextfield.backgroundColor = UIColor.blackColor()
        passwordTextfield.delegate = self
        self.view.backgroundColor = UIColor.darkGrayColor()

        super.viewDidLoad()

       
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
       
    }
    
 

    @IBAction func register(sender: AnyObject)
    {
        
        if OldPassTextfield.text == oldPassword!
        {
        delegate?.writeBack(passwordTextfield.text)
        self.navigationController?.popViewControllerAnimated(true)
        }
    
    }
    
   
    
  
    
   
}
