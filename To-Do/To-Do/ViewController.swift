//
//  ViewController.swift
//  To-Do
//
//  Created by Mees Fröberg on 19/11/15.
//  Copyright © 2015 Mees Fröberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    // Outlets.
    @IBOutlet weak var listsOutlet: UITableView!
    @IBOutlet weak var textFieldOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults.setObject([String](), forKey: "listData")
        
//        let gesture: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "longPressed")
//        gesture.minimumPressDuration = 1.0
//        self.listsOutlet.addGestureRecognizer(gesture)
        
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
        var listsData = defaults.arrayForKey("listData") as! [String]
        listsData.append(textFieldOutlet.text!)
        defaults.setObject(listsData, forKey: "listData")
        
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
        let listsData = defaults.arrayForKey("listData") as! [String]
        return listsData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if tableView == listsOutlet {
            let cell = listsOutlet.dequeueReusableCellWithIdentifier("TextCell", forIndexPath: indexPath)
            
            let row = indexPath.row
            let listsData = defaults.arrayForKey("listData") as! [String]
            cell.textLabel?.text = listsData[row]
            
            return cell
        }
        return UITableViewCell()
    }
//    
//    func longPressed(longPress: UIGestureRecognizer) {
//        let state = longPress.state
//        let location = longPress.locationInView(self.listsOutlet)
//		let indexPath = listsOutlet.indexPathForRowAtPoint(location)
//        
//        if state == UIGestureRecognizerState.Ended {
//        	var listsData = defaults.arrayForKey("listData") as! [String]
//            listsData.removeAtIndex(indexPath!.row)
//            print("Ended")
//        }else if state == UIGestureRecognizerState.Began {
//            print("Began")
//        }
//    }
}

