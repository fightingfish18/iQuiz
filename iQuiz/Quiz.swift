//
//  Quiz.swift
//  iQuiz
//
//  Created by Smyth May on 11/10/15.
//  Copyright © 2015 Smyth May. All rights reserved.
//

import Foundation

class Quiz {
    var questions : [String];
    var answers : [String];
    var choices : [[String]];
    var questionNumber : Int;
    var correctAnswer : Int;
    var wasCorrect : Bool!;
    var isFinished : Bool;
    var subject : String;
    
    init(questions : [String], answers : [String], choices : [[String]], subject : String) {
        self.questions = questions;
        self.answers = answers;
        self.choices = choices;
        self.questionNumber = 0;
        self.correctAnswer = 0;
        self.isFinished = false;
        self.subject = subject;
    }
    
    func askQuestion() -> String {
        return questions[questionNumber];
    }
    
    func fetchChoices() -> [String] {
        return choices[questionNumber];
    }
    
    func fetchAnswer() -> String {
        return answers[questionNumber];
    }
    
    func next(correct : Bool) {
        self.questionNumber++;
        if (correct) {
            self.correctAnswer++;
        }
        wasCorrect = correct;
        if questionNumber == questions.count {
            isFinished = true;
        }
    }
}