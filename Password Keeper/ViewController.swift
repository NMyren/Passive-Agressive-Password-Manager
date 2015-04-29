//
//  ViewController.swift
//  Password Keeper
//
//  Created by nmyren on 4/21/15.
//  Copyright (c) 2015 nmyren. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var editButton: UIBarButtonItem!
    
    @IBAction func onTappedEditButton(sender: UIBarButtonItem)
    {
        if sender.tag == 0
        {
            tableView.editing = true
            sender.tag = 1
            
        }
        else
        {
            tableView.editing = false
            sender.tag = 0
        }
        
        
        
    }
    var websites = [[String]]()
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return websites.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        as UITableViewCell
        cell.textLabel?.text = websites[indexPath.row][0]
        return cell
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return  true
    }

    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        var website = websites[sourceIndexPath.row]
        websites.removeAtIndex(sourceIndexPath.row)
        websites.insert(website, atIndex: destinationIndexPath.row)
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        editButton.tag = 0
        websites.append(["Google"])
        websites.append(["facebook"])
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }


}

