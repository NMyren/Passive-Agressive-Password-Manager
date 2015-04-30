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
     var dataFilePath: String?
    
       var websites = [[String]]()
    
    
    override func viewDidLoad()
    {
        
        var nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.Black
        nav?.tintColor = UIColor.orangeColor()
        super.viewDidLoad()
        tableView.separatorColor = UIColor.blackColor()
        tableView.backgroundColor = UIColor.grayColor()
        editButton.tag = 0
        
        let filemgr = NSFileManager.defaultManager()
        let dirPaths =
        NSSearchPathForDirectoriesInDomains(.DocumentDirectory,
            .UserDomainMask, true)
        
        let docsDir = dirPaths[0] as String
        dataFilePath =
            docsDir.stringByAppendingPathComponent("data.archive")
        
        if filemgr.fileExistsAtPath(dataFilePath!) {
            let dataArray =
            NSKeyedUnarchiver.unarchiveObjectWithFile(dataFilePath!)
                as [[String]]
            websites = dataArray
            
            
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
            websites.removeAtIndex(indexPath.row)
            self.saveInfo()
            self.tableView.reloadData()
        }
    }
    
    @IBAction func onTappedEditButton(sender: UIBarButtonItem)
    {
        if sender.tag == 0
        {
            tableView.editing = true
            sender.tag = 1
            sender.title = "Done"
        }
        else
        {
            tableView.editing = false
            sender.tag = 0
            sender.title = "Edit"
            
        }
        
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return websites.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        as UITableViewCell
        cell.textLabel?.text = websites[indexPath.row][0]
        cell.textLabel?.font = UIFont.systemFontOfSize(20.0)
        cell.textLabel?.textColor = UIColor.orangeColor()
        cell.backgroundColor = UIColor.grayColor()
        
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
        self.saveInfo()
        
    }


    @IBAction func addButton(sender: AnyObject)
    {
        var alert = UIAlertController(title: "Add Website", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        alert.view.tintColor = UIColor.orangeColor()
        alert.addTextFieldWithConfigurationHandler
            {
                (textField) -> Void in textField.placeholder = "Website"
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
        
        var addAction = UIAlertAction(title: "Add Website", style: UIAlertActionStyle.Default)
            {
                (action) -> Void in
                var text1 = alert.textFields?[0] as UITextField
                var text2 = alert.textFields?[1] as UITextField
                var text3 = alert.textFields?[2] as UITextField
                var site = [text1.text!,text2.text!,text3.text!]
                self.websites.append(site)
                self.saveInfo()
                self.tableView.reloadData()
        }
        alert.addAction(addAction)
        
        self.presentViewController(alert, animated: true, completion: nil)

    }
    
    func saveInfo()
    {
   
        NSKeyedArchiver.archiveRootObject(websites,
            toFile: dataFilePath!)
        
    }
 

}

