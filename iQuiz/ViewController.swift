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
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        NSLog("Segue prepared");
        if (segue.identifier == "questionSegue") {
            let svc = segue!.destinationViewController as! QuestionViewController;
            svc.subjectText = self.selectedItem;
            switch(self.selectedItem) {
            case "Mathematics":
                self.selectedQuiz = Quiz(questions: mathQuestions, answers : mathAnswers, choices : mathChoices, subject : self.selectedItem);
            case "Science":
                self.selectedQuiz = Quiz(questions: scienceQuestions, answers: scienceAnswers, choices : scienceChoices, subject : self.selectedItem);
            case "Marvel Super Heroes":
                self.selectedQuiz = Quiz(questions: marvelQuestions, answers: marvelAnswers, choices: marvelChoices, subject : self.selectedItem);
            default:
                "asdf";
            }
            svc.quiz = self.selectedQuiz;
        }
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
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.selectedItem = tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.text;
        self.performSegueWithIdentifier("questionSegue", sender: self);
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

