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
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var submit: UIButton!
    
    var quiz : Quiz!;
    var subjectText : String!
    var selectedAnswer : String!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        subjectLabel.text = subjectText;
        questionText.text = quiz.askQuestion();
        let choices = quiz.fetchChoices();
        populateChoices(choices);
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "answerSegue") {
            let svc = segue.destinationViewController as! AnswerViewController;
            svc.quiz = quiz;
            svc.userAnswer = selectedAnswer;
        }
    }
    
    func populateChoices(choices : [String]) {
        b1.setTitle(choices[0], forState : .Normal);
        b1.addTarget(self, action: "selectAnswer:", forControlEvents: .TouchUpInside);
        b2.setTitle(choices[1], forState : .Normal);
        b2.addTarget(self, action: "selectAnswer:", forControlEvents: .TouchUpInside);
        b3.setTitle(choices[2], forState : .Normal);
        b3.addTarget(self, action: "selectAnswer:", forControlEvents: .TouchUpInside);
        b4.setTitle(choices[3], forState : .Normal);
        b4.addTarget(self, action: "selectAnswer:", forControlEvents: .TouchUpInside);
        submit.addTarget(self, action: "submitAnswer:", forControlEvents: .TouchUpInside);
    }
    
    @IBAction func submitAnswer(sender: UIButton) {
        if selectedAnswer != nil {
            self.performSegueWithIdentifier("answerSegue", sender: self);
        }
    }
    
    @IBAction func selectAnswer(sender: UIButton) {
        selectedAnswer = sender.titleLabel!.text;
        NSLog("\(selectedAnswer)");
    }
    
}
