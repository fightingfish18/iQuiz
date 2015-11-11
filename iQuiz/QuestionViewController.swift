//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Smyth May on 11/10/15.
//  Copyright © 2015 Smyth May. All rights reserved.
//

import UIKit

class QuestionViewController : UIViewController {
    @IBOutlet weak var subjectLabel: UILabel!
    var subjectText : String!
    var questionArray : [String]!;
    var questionNumber : Int!;
    var numberCorrect : Int!;
    var correctAnswerArray : [Int]!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        subjectLabel.text = subjectText;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        
        
    }
}
