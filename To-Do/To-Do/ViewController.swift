//
//  ViewController.swift
//  To-Do
//
//  Created by Mees Fröberg on 19/11/15.
//  Copyright © 2015 Mees Fröberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var listsData:[String]!
    
    // Outlets.
    @IBOutlet weak var listsOutlet: UITableView!
    @IBOutlet weak var textFieldOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listsData = []
        listsOutlet.delegate = self
        listsOutlet.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Button action.
    @IBAction func addButton(sender: AnyObject) {
        //add your data into tables array from textField
        listsData.append(textFieldOutlet.text!)
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            //reload your tableView
            self.listsOutlet.reloadData()
        })
        
        textFieldOutlet.text = ""
        print(listsData)
    }
    
    // Delegate methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listsData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if tableView == listsOutlet {
            let cell = listsOutlet.dequeueReusableCellWithIdentifier("TextCell", forIndexPath: indexPath)
            
            let row = indexPath.row
            cell.textLabel?.text = listsData[row]
        
            return cell
        }
        return UITableViewCell()
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        print(listsData[row])
    }
}

