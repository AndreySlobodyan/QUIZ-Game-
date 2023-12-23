//
//  StatisticCellModel.swift
//  QUIZ Game Applications
//
//  Created by mac on 09.11.2023.
//

import Foundation

struct StatisticCellModel: Codable {
    
    var documentID: String
    let category: String
    let wrongScor: Int
    let corectScor: Int
    let surveyDate: Double
    var isFavorite: Bool
    let question: [String]
    let answer: [String]
}


struct StatisticBackend: Codable {
    
    let category: String
    let wrongScor: Int
    let corectScor: Int
    var isFavorite: Bool
    var documentID: String
    let answer: [String]
    let question: [String]
    let surveyDate: Double
    
    enum CodingKeys: String, CodingKey {
       
       case surveyDate
       case question
       case answer
       case category
       case wrongScor
       case corectScor
       case isFavorite
       case documentID
    }
}
