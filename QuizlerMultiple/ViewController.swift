//
//  ViewController.swift
//  QuizlerMultiple
//
//  Created by Simge ŞİŞMAN on 25.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var Answer1: UIButton!
    @IBOutlet weak var Answer2: UIButton!
    @IBOutlet weak var Answer3: UIButton!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var ProgressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        QuestionLabel.adjustsFontSizeToFitWidth = true
        var nq = 0
        QuestionLabel.text = quizBrain.getQuestion(questionNumber: nq)
        Answer1.setTitle(quizBrain.getAnswer(questionNumber: nq, no: 0),for: UIControl.State.normal)
        Answer2.setTitle(quizBrain.getAnswer(questionNumber: nq, no: 1), for: UIControl.State.normal)
        Answer3.setTitle(quizBrain.getAnswer(questionNumber: nq, no: 2), for: UIControl.State.normal)
        ScoreLabel.text = "Your Score:"
        ProgressBar.progress = 0
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        QuestionLabel.adjustsFontSizeToFitWidth = true
        var checkAnswer = quizBrain.newAns()
        var check = quizBrain.checkAnswer(currentTitle: sender.currentTitle!, sender: sender)
        ScoreLabel.text = "Your Score:\(check)"
        var newq = quizBrain.newUI()
        ProgressBar.progress = quizBrain.getProgress(q: newq)
        QuestionLabel.text = quizBrain.getQuestion(questionNumber: newq)
        Answer1.setTitle(quizBrain.getAnswer(questionNumber: newq, no: 0),for: UIControl.State.normal)
        Answer2.setTitle(quizBrain.getAnswer(questionNumber: newq, no: 1), for: UIControl.State.normal)
        Answer3.setTitle(quizBrain.getAnswer(questionNumber: newq, no: 2), for: UIControl.State.normal)
        
    }
    
}

