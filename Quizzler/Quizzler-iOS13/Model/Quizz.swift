//
//  QuizzService.swift
//  Quizzler-iOS13
//
//  Created by Matheus on 08/04/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct Quizz{
    let quizzes = [
        Question(text: "Four + Two is equal to Six.", answer: "True"),
        Question(text: "Five - Three is greater than One.", answer: "True"),
        Question(text: "Three + Eight is less than ten.", answer: "True"),
    ]
    
    var currentQuestion: Int = 0
    var score: Int = 0
    
    public mutating func checkAnswer(_ answer: String) -> Bool{
        if answer == self.quizzes[currentQuestion].answer{
            self.score += 1
            return true
        }else{
            return false
        }
    }
    
    public mutating func updateQuestion(){
        if currentQuestion + 1 < self.quizzes.count {
            currentQuestion += 1
        }else{
            currentQuestion = 0
        }
    }
    
    public func getCurrentQuestionText() -> String {
        return self.quizzes[self.currentQuestion].text
    }
    public func currentProgress() -> Float {
        return Float(self.currentQuestion + 1)/Float(self.quizzes.count)
    }
    public func getCurrentScore() -> Int {
        return self.score
    }
}
