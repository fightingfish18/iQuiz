//
//  SettingsViewController.swift
//  iQuiz
//
//  Created by Admin on 11/19/15.
//  Copyright © 2015 Smyth May. All rights reserved.
//

import UIKit
import CoreData

class SettingsViewController : ViewController {
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet var doneButton: UIView!
    @IBOutlet weak var urlBar: UITextField!
    
    override func viewDidLoad() {
        self.urlBar.text = "http://tednewardsandbox.site44.com/questions.json";
        self.downloadButton.addTarget(self, action: "downloadData:", forControlEvents: .TouchUpInside);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    @IBAction func downloadData(sender : UIButton) {
        let url = NSURL(string: self.urlBar.text!)!
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            if let _ = data {
                self.writeData(data!);
            }
        }
        task.resume()
    }
    
    func writeData(data : NSData) {
        let defaults = NSUserDefaults.standardUserDefaults();
        defaults.setObject(data, forKey: "quizzes");
                //let defaults = NSUSerDefaults.standardUserDefaults();
    }
}
