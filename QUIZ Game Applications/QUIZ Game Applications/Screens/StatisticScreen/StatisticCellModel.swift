//
//  StatisticCellModel.swift
//  QUIZ Game Applications
//
//  Created by mac on 09.11.2023.
//

import Foundation

struct StatisticCellModel {
    
    let category: String
    let wrongScor: Int
    let corectScor: Int
    let Surveydate: Double
    var isFavorite: Bool
    let question: [String]
    let answer: [String]
}
