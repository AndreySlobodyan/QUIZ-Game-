//
//  QuestionPresenter.swift
//  QUIZ Game Applications
//
//  Created by mac on 05.08.2023.
//

import Foundation

protocol QuestionPresentahionLogic {
    func present(data: QuizzDataModel)
}


class QuestionPresenter{
    
    weak var viewController: QuestionDisplayLogic?
    
}

extension QuestionPresenter: QuestionPresentahionLogic {
    func present(data: QuizzDataModel) {
        
        let filteredQuestions = data.questionModel.filter { $0.id == data.quizzModel.id }
        let dataTodisplay = QuizzDataModel(quizzModel: data.quizzModel, questionModel: filteredQuestions)
       viewController?.display(data: dataTodisplay)
    }
}
