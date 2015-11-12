//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Admin on 11/11/15.
//  Copyright © 2015 Smyth May. All rights reserved.
//

import UIKit

class AnswerViewController : ViewController {
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var answerStatus: UILabel!
    @IBOutlet weak var correctAnswerText: UILabel!
    @IBOutlet weak var selectedAnswerText: UILabel!
    @IBOutlet weak var questionText: UILabel!
    
    var wasCorrect : Bool!;
    var quiz : Quiz!
    var userAnswer : String!;
    
    override func viewDidLoad() {
        correctAnswerText.text! = quiz.fetchAnswer();
        selectedAnswerText.text! = userAnswer;
        questionText.text! = quiz.askQuestion();
        quiz.next(quiz.fetchAnswer() == userAnswer);
        if (quiz.wasCorrect!) {
            answerStatus.text! = "Congrats, you got it right";
        } else {
            answerStatus.text! = "Sorry, maybe next time";
        }
        if quiz.isFinished {
            nextButton.setTitle("Finish", forState : .Normal);
        }
        nextButton.addTarget(self, action: "proceed:", forControlEvents: .TouchUpInside);
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    override func prepareForSegue(segue : UIStoryboardSegue, sender : AnyObject?) {
        if segue.identifier == "finishQuiz" {
            let svc = segue.destinationViewController as! FinishQuizViewController;
            svc.quiz = quiz;
            svc.subjectText = quiz.subject;
        } else if segue.identifier == "nextQuestion" {
            let svc = segue.destinationViewController as! QuestionViewController;
            svc.quiz = quiz;
            svc.subjectText = quiz.subject;
        }
    }
    
    @IBAction func proceed(sender: UIButton) {
        if quiz.isFinished {
            self.performSegueWithIdentifier("finishQuiz", sender: self);
        } else {
            self.performSegueWithIdentifier("nextQuestion", sender: self)
        }
    }
}
