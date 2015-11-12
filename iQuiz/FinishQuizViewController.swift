//
//  FinishQuizViewController.swift
//  iQuiz
//
//  Created by Admin on 11/12/15.
//  Copyright © 2015 Smyth May. All rights reserved.
//

import UIKit

class FinishQuizViewController : ViewController {
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var numCorrect: UILabel!
    @IBOutlet weak var statusText: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    var quiz : Quiz!;
    var subjectText : String!
    
    
    
    override func viewDidLoad() {
        subjectLabel.text! = subjectText;
        numCorrect.text! = "You got \(quiz.correctAnswer) out of \(quiz.questionNumber) correct";
        if quiz.questionNumber == quiz.correctAnswer {
            statusText.text! = "Perfect!";
        } else {
            statusText.text! = "Almost!";
        }
        finishButton.addTarget(self, action: "finishQuiz:", forControlEvents: .TouchUpInside);
    }
    
    override func didReceiveMemoryWarning() {
    
    }
    
    @IBAction func finishQuiz(sender : UIButton) {
        let _ = performSegueWithIdentifier("subjectSelection", sender: self);
    }
}
