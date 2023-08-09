//
//  QuestionModel.swift
//  QUIZ Game Applications
//
//  Created by mac on 05.08.2023.
//

import Foundation

struct QuestionModel {
    let id: Int
    let question: String
    let correctAnswer: String
    let wrongAnswers: [String]
}

