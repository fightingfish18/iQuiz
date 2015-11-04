//
//  ViewController.swift
//  iQuiz
//
//  Created by Admin on 11/3/15.
//  Copyright © 2015 Smyth May. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIToolbarDelegate {
    
    let subjects : [String] = ["Mathematics", "Marvel Super Heroes", "Science"];
    let descriptions : [String] = ["One of the oldest fields of study", "Pop culture and super heroes!", "The study of life, the universe, and everything"];
    
    @IBOutlet
    var tableView : UITableView!;
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell");
        settingsButton.action = "settingsAlert:";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!;
        cell = UITableViewCell(style: UITableViewCellStyle.Subtitle,
            reuseIdentifier: "cell");
        cell.textLabel?.text = self.subjects[indexPath.row];
        cell.imageView!.image = UIImage(named : self.subjects[indexPath.row]);
        cell.detailTextLabel?.text = self.descriptions[indexPath.row];
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("Pressed");
    }
    
    func settingsAlert(sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Settings", message: "Settings Go Here", preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            
        }
        alertController.addAction(OKAction);
        self.presentViewController(alertController, animated: true) {
            
        }
    }


}

