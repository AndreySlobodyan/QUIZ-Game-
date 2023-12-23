//
//  BackendModel.swift
//  QUIZ Game Applications
//
//  Created by mac on 24.07.2023.
//
import Foundation

struct QuizzBackendModel: Codable {
    
    let categories: String
    let correctAnswer: String
    let id: Int
    let wrongAnswers: [String]
}

struct QuizzResponse: Codable {
    let results: [String: QuizzBackendModel]
}
