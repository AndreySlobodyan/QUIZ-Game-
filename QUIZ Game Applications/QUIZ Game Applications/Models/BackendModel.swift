//
//  BackendModel.swift
//  QUIZ Game Applications
//
//  Created by mac on 24.07.2023.
//
import Foundation

struct QuizzBackendModel {
    
    let categories: String
    let id: Int
    let question: String
    let correctAnswer: String
    let wrongAnswers: [String]
}
