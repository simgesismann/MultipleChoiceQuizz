//
//  QuestionBrain.swift
//  QuizlerMultiple
//
//  Created by Simge ŞİŞMAN on 26.06.2022.
//

import Foundation
import UIKit
import AVFoundation

struct QuizBrain {
    let quiz:[Question] = [Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")]
    // I want to increase question number when I click button and I started it from 0
    var questionNumber = 0
    mutating func newUI()->Int{ // it will increase by +1 where func is called
        if questionNumber+1<quiz.count{
            questionNumber += 1
            return questionNumber  // it will return question number as 1 at first because first question is shown when view is load
        }else{
            questionNumber = 0   // if question number is greater than quiz count return 0 and start again
            return questionNumber
        }
    }
    
    // I want to get my answerNumber and it started from -1 because when you press button
    // I want to see 0.inx answer
    // when view is load there is first question but when button is pressed first answer will be there
    var answerNumber = -1
    mutating func newAns()->Int{
        if answerNumber+1<quiz.count{
            answerNumber += 1   // each time when you call this func it will increase by 1
            return answerNumber // ansNo = 0 at first
        }else{
            answerNumber = 0
            return answerNumber
        }
    }
    
    // I want to get question from quiz Array
    // parameter will be question number which is called by newUI()
    mutating func getQuestion(questionNumber:Int)->String{
            var nextQuestion = quiz[questionNumber].q
            return nextQuestion
    }
    
    
    // I want to get answer from quiz Array
    //parameter will bw answerNumber which is called by newAns()
    //no : parameter is to get multiple choices code includes three times this function
    mutating func getAnswer(questionNumber:Int,no: Int)->String{
            var nextA1 = quiz[questionNumber].a[no]
            return nextA1
    }
    
    var player: AVAudioPlayer!
    mutating func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    //checkAnswer func is to check answer
    var checkAnswerNo = -1
    var score = 0
    mutating func checkAnswer(currentTitle:String,sender:UIButton)->Int{
        checkAnswerNo+=1 // checkans = 0
        if checkAnswerNo<quiz.count{ //checkAnswerNo+1<quiz is not used because last answer will not play sound in that case
            var correct = quiz[checkAnswerNo].c
            if currentTitle == correct{
                playSound(soundName: "B")
            }else{
                playSound(soundName: "WrongSound")
            }
        }
        if checkAnswerNo+1<quiz.count{ //if checkans +1 < quizcount , to not crash
            var correct = quiz[checkAnswerNo].c //correct variable shows, right ans from quiz
            if currentTitle == correct{ //if you found correct ans
                score += 1 // your score will inc
                var a = sender.backgroundColor // I want to change color when you re right
                sender.backgroundColor = UIColor.green
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    sender.backgroundColor = a // for a moment and then come back to normal color
                }
                return score // of course show me what is my score which is increased
            }else{ // if you re not right I want to change color as red for a moment
                var b = sender.backgroundColor
                playSound(soundName: "WrongSound")
                sender.backgroundColor = UIColor.red
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    sender.backgroundColor = b //then change it to normal color
                }
                return score // show me my score which is not increased
            }
        }else{ // if my checkans no is greater than question number
            print("done") // tell me quiz is done
            score = 0 // start score again
            checkAnswerNo = -1 // to start it over and to go back to beginning func
            return score // of course show me 0
        }
    }
    

    // to calculate progress ratio : It ll increase when question number is increased
    func getProgress(q:Int)->Float{
        var ratio = Float(q) / Float(quiz.count)
        return ratio
    }
    
        
}

