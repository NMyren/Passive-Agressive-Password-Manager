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
    
    @IBOutlet weak var insultLabel: UILabel!
    
    @IBOutlet weak var strengthView: UIView!
    var delegate : sendBack?
    
    var rater = PasswordRater()
    
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
                var site = ["","",""]
                if text1.text != ""
                {
                    site[0] = text1.text
                }
                if text2.text != ""
                {
                    site[1] = text2.text
                }
                if text3.text != ""
                {
                    site[2] = text3.text
                }
                if site[0] != ""
                {
                    self.website[0] = site[0]
                }
                if site[1] != ""
                {
                    self.website[1] = site[1]
                }
                if site[2] != ""
                {
                    self.website[2] = site[2]
                }
                self.delegate?.writePasswordBack(self.website, index: self.index)
                self.websiteLabel.text = self.website[0]
                self.usernameLabel.text = self.website[1]
                self.passwordLabel.text = self.website[2]
                self.ratePassword()
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
        ratePassword()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }

    func ratePassword()
    {
        var output = rater.returnString(passwordLabel.text!)
        if output[0] == "f"
        {
            strengthView.backgroundColor = UIColor.redColor()
        }
        if output[0] == "d"
        {
            strengthView.backgroundColor = UIColor.yellowColor()
        }
        if output[0] == "c"
        {
            strengthView.backgroundColor = UIColor.orangeColor()
        }
        if output[0] == "a"
        {
            strengthView.backgroundColor = UIColor.greenColor()
        }
        insultLabel.text = output[1]
    }
    
}
