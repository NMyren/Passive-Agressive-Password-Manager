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
    
    @IBOutlet var websiteLabel: UILabel!
    
    @IBOutlet var usernameLabel: UILabel!
    
    @IBOutlet var passwordLabel: UILabel!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
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
