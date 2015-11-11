//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Smyth May on 11/10/15.
//  Copyright © 2015 Smyth May. All rights reserved.
//

import UIKit

class QuestionViewController : UIViewController {
    var testData : String!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        NSLog("\(testData)");
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        
        
    }
}
