//
//  Question.swift
//  QuizlerMultiple
//
//  Created by Simge ŞİŞMAN on 26.06.2022.
//

import Foundation

struct Question{
    var q : String
    var a : [String]
    var c : String
    
    init (q:String,a:[String],correctAnswer:String){
        self.q = q
        self.a = a
        self.c = correctAnswer
        
    }
}
