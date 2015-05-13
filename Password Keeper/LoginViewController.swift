//
//  LoginViewController.swift
//  Password Keeper
//
//  Created by nmyren on 5/1/15.
//  Copyright (c) 2015 nmyren. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, passDataBack, UITextFieldDelegate
{
  
    var password: String? = nil
    var newPassword: String? = nil
    
    @IBOutlet var passTextField: UITextField!

    
    override func viewDidLoad()
    {
        getPassword()
        passTextField.delegate = self
        self.view.backgroundColor = UIColor.darkGrayColor()
        passTextField.backgroundColor = UIColor.blackColor()
        var nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.Black
        nav?.tintColor = UIColor.orangeColor()
 
        super.viewDidLoad()

       
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func savePassword ()
    {
   
        NSUserDefaults.standardUserDefaults().setObject(password, forKey: "password")
    }
   
    func getPassword() {
        self.password = NSUserDefaults.standardUserDefaults().objectForKey("password") as? String
    
    }
   
    
    @IBAction func Login(sender: AnyObject)
    {

        if (newPassword == nil)
        {
          getPassword()

        }
        else
        {
            password = newPassword!
            savePassword()
            newPassword = nil
        }
        
        if (password != nil)
        {
            if (passTextField.text == password)
            {
                savePassword()
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
        else
        {
            self.dismissViewControllerAnimated(true, completion: nil)
        }

       
    }

   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var secondVC = (segue.destinationViewController as RegisterViewController)
        secondVC.delegate = self
        secondVC.oldPassword = password!
    }
    
    func writeBack(pass: String)
    {
        newPassword = pass
    }
   
}

protocol passDataBack{
    
    func writeBack(pass: String)

}
