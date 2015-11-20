//
//  ViewController.swift
//  iQuiz
//
//  Created by Admin on 11/3/15.
//  Copyright © 2015 Smyth May. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIToolbarDelegate {
    
    let descriptions : [String] = ["One of the oldest fields of study", "Pop culture and super heroes!", "The study of life, the universe, and everything"];
    
    let mathQuestions : [String] = ["What is 2 + 2?", "What is 3 x 3?", "How many sides does a triangle have?"];
    let mathAnswers : [String] = ["4", "9", "3"];
    let mathChoices : [[String]] = [["4", "5", "2", "3"], ["3", "87", "9", "2"], ["2", "4", "6", "3"]];
    
    let scienceQuestions : [String] = ["How many particles make up an atom?", "What is the study of life called?", "What is the acceleration of gravity?"];
    let scienceAnswers : [String] = ["3", "Biology", "9.8 m/s^2"];
    let scienceChoices : [[String]] = [["5", "7", "9", "3"], ["Biology", "Physics", "Fission", "Chemistry"], ["7 m/s^2", "8 m/s ^2", "9.8 m/s^2", "10.5 m/s^2"]];
    
    let marvelQuestions : [String] = ["Who is the leader of the X-Men?", "Who is the Norse god of thunder?"];
    let marvelAnswers : [String] = ["Professor Charles Xavier", "Thor"];
    let marvelChoices : [[String]] = [["Wolverine", "Professor Charles Xavier", "Syndra", "Cyclops"], ["Thor", "Loki", "Sabretooth", "Captain America"]];
    
    @IBOutlet
    var tableView : UITableView!;
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    var selectedItem : String!;
    var selectedQuiz : Quiz!;
    var quizzes : [Quiz]!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        quizzes = Array();
        readData();
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell");
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        NSLog("Segue prepared");
        if (segue.identifier == "questionSegue") {
            let svc = segue!.destinationViewController as! QuestionViewController;
            svc.subjectText = self.selectedItem;
            switch(self.selectedItem) {
            case quizzes[0].subject:
                self.selectedQuiz = quizzes[0];
            case quizzes[1].subject:
                self.selectedQuiz = quizzes[1];
            case quizzes[2].subject:
                self.selectedQuiz = quizzes[2];
            default:
                "asdf";
            }
            svc.quiz = self.selectedQuiz;
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!;
        cell = UITableViewCell(style: UITableViewCellStyle.Subtitle,
            reuseIdentifier: "cell");
        cell.textLabel?.text = self.quizzes[indexPath.row].subject;
        //cell.imageView!.image = UIImage(named : self.subjects[indexPath.row]);
        cell.detailTextLabel?.text = self.quizzes[indexPath.row].description;
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.selectedItem = tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.text;
        self.performSegueWithIdentifier("questionSegue", sender: self);
    }
    
    @IBAction func exit(segue: UIStoryboardSegue) {
        viewDidLoad();
        readData();
    }
    
    func readData() {
        let defaults = NSUserDefaults.standardUserDefaults();
        let rawData = defaults.objectForKey("quizzes") as? NSData;
        var data : [NSDictionary]!;
        if rawData != nil {
            do {
                data = try NSJSONSerialization.JSONObjectWithData(rawData!, options: NSJSONReadingOptions.AllowFragments) as! [NSDictionary];
                //quizzes = [Quiz]();
                for item in data {
                    let title = item["title"] as! String;
                    print(title);
                    let desc = item["desc"] as! String;
                    let questions = item["questions"] as! [NSDictionary];
                    var choices = [[String]]();
                    var questionText = [String]();
                    var correctAnswers = [String]();
                    for question in questions {
                        let answers = question["answers"] as! [String];
                        choices.append(answers);
                        questionText.append(question["text"] as! String);
                        let answer = Int(question["answer"] as! String)! - 1;
                        let correctAnswer = answers[answer];
                        correctAnswers.append(correctAnswer);
                    }
                    quizzes.append(Quiz(questions: questionText, answers: correctAnswers, choices: choices, subject: title, description : desc));
                }

            } catch {
                quizzes.append(Quiz(questions: marvelQuestions, answers: marvelAnswers, choices: marvelChoices, subject : "Marvel Super Heroes", description : descriptions[1]));
                quizzes.append(Quiz(questions: scienceQuestions, answers: scienceAnswers, choices : scienceChoices, subject : "Science", description : descriptions[2]));
                quizzes.append(Quiz(questions: mathQuestions, answers : mathAnswers, choices : mathChoices, subject : "Math", description : descriptions[0]));
            
            }
        } else {
            quizzes.append(Quiz(questions: marvelQuestions, answers: marvelAnswers, choices: marvelChoices, subject : "Marvel Super Heroes", description : descriptions[1]));
            quizzes.append(Quiz(questions: scienceQuestions, answers: scienceAnswers, choices : scienceChoices, subject : "Science", description : descriptions[2]));
            quizzes.append(Quiz(questions: mathQuestions, answers : mathAnswers, choices : mathChoices, subject : "Math", description : descriptions[0]));
        }
    }
}

