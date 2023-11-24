//
//  QuizzInteractor.swift
//  QUIZ Game Applications
//
//  Created by mac on 16.07.2023.
//

import Foundation

protocol QuizzBusinessLogic {
    
    func request()
}

class QuizzInteractor {
    
//MARK: -  InteractorDelegate
    var presenter: QuizzPresentahionLogic?
}

//MARK: - BusinessLogic
extension QuizzInteractor: QuizzBusinessLogic {
    
    func request() {
        var response = [QuizzBackendModel]()
        let responceData = QuizzBackendModel(categories: "Mathematics", id: 1, question: "2 + 2 = ?", correctAnswer: "4", wrongAnswers: ["3", "5", "6"]  )
        let responceData1 = QuizzBackendModel(categories: "Physics", id: 2, question: "Какой термометр появился первым?", correctAnswer: "A", wrongAnswers: ["B", "C", "D"])
        let responceData2 = QuizzBackendModel(categories: "Biology", id: 3, question: "Что изучает ботаника?", correctAnswer: "B", wrongAnswers: ["A", "C", "D"])
        let responceData3 = QuizzBackendModel(categories: "Geography", id: 4, question: "Как называются пять океанов мира?", correctAnswer: "C", wrongAnswers: ["D", "B", "A"])
        response.append(responceData)
        response.append(responceData1)
        response.append(responceData2)
        response.append(responceData3)
        
        presenter?.present(data: response)
    }
}
