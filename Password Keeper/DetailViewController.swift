//
//  DetailViewController.swift
//  Password Keeper
//
//  Created by blowery on 4/24/15.
//  Copyright (c) 2015 nmyren. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    var website = [String]()
    var index: Int!
    var button: UIBarButtonItem!
    @IBOutlet var websiteLabel: UILabel!
    
    @IBOutlet var usernameLabel: UILabel!
    
    @IBOutlet var passwordLabel: UILabel!
    
    var delegate : sendBack?
    
    
    func editPassword()
    {
        var alert = UIAlertController(title: "Change Password", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        alert.view.tintColor = UIColor.grayColor()
        alert.addTextFieldWithConfigurationHandler
            {
                (textField) -> Void in textField.placeholder = "Identifier"
        }
        alert.addTextFieldWithConfigurationHandler
            {
                (textField) -> Void in textField.placeholder = "Username"
        }
        alert.addTextFieldWithConfigurationHandler
            {
                (textField) -> Void in textField.placeholder = "Password"
        }
        var cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(cancelAction)
        
        var addAction = UIAlertAction(title: "Change Password", style: UIAlertActionStyle.Default)
            {
                (action) -> Void in
                var text1 = alert.textFields?[0] as UITextField
                var text2 = alert.textFields?[1] as UITextField
                var text3 = alert.textFields?[2] as UITextField
                var site = [text1.text!,text2.text!,text3.text!]
                self.website = site
                self.delegate?.writePasswordBack(self.website, index: self.index)
                self.websiteLabel.text = self.website[0]
                self.usernameLabel.text = self.website[1]
                self.passwordLabel.text = self.website[2]
        }
        alert.addAction(addAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
   
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        button = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.Plain, target: self, action: "editPassword")
        self.navigationItem.rightBarButtonItem = button
        var nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.Black
        nav?.tintColor = UIColor.orangeColor()
        super.view.backgroundColor = UIColor.darkGrayColor()
        websiteLabel.textColor = UIColor.orangeColor()
        usernameLabel.textColor = UIColor.orangeColor()
        passwordLabel.textColor = UIColor.orangeColor()
        websiteLabel.text = website[0]
        if website.count > 1
        {
            usernameLabel.text = website[1]
        }
        else
        {
            usernameLabel.text = "No Username"
        }
        if website.count > 2
        {
            passwordLabel.text = website[2]
        }
        else
        {
            passwordLabel.text = "No Password"
        }
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }

    
}
