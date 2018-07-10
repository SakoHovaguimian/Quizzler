//
//  Question.swift
//  Quizzler
//
//  Created by Sako Hovaguimian on 5/8/18.
//  Copyright © 2018 Sako Hovaguimian. All rights reserved.
//

import UIKit


class Question {
    
    let questionText : String
    let answer : Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}


