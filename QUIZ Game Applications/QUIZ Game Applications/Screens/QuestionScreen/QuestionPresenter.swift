//
//  QuestionPresenter.swift
//  QUIZ Game Applications
//
//  Created by mac on 05.08.2023.
//

import Foundation

protocol QuestionPresentahionLogic {
    func questionLogic()
    func present(data: QuizzDataModel)
    func answerLogic(selected: String)
}

class QuestionPresenter {
    
    weak var viewController: QuestionDisplayLogic?
    private var dataTodisplayQuestion: QuizzDataModel?
    private var currentQuestionIndex: Int = 0
    private var correctAnswer: String = ""
    private var wrongAnswers: [String] = []
    private var wrongQuestionScore: Int = 0
    private var correctQuestionScore: Int = 0
    
}

extension QuestionPresenter: QuestionPresentahionLogic {
    
    func answerLogic(selected: String) {
        
        if correctAnswer ==  selected {
            viewController?.correcShowAlert()
            correctQuestionScore += 1
        } else {
            viewController?.wrongShowAlert()
            wrongQuestionScore += 1
        }
    }
    
    func questionLogic() {
        
        currentQuestionIndex += 1
        guard currentQuestionIndex < dataTodisplayQuestion?.questionModel.count ?? .zero else {
            viewController?.showQuizzScore(wrongScore: wrongQuestionScore, correctScore: correctQuestionScore)
            return
        }
        guard let questionModel = dataTodisplayQuestion?.questionModel[currentQuestionIndex] else { return }
        correctAnswer = questionModel.correctAnswer
        wrongAnswers = questionModel.wrongAnswers
        viewController?.display(data: questionModel)
    }
    
    func present(data: QuizzDataModel) {
        
        let filteredQuestions = data.questionModel.filter { $0.id == data.quizzModel.id }
        dataTodisplayQuestion = QuizzDataModel(quizzModel: data.quizzModel, questionModel: filteredQuestions)
        guard let questionModel = dataTodisplayQuestion?.questionModel[currentQuestionIndex] else { return }
        correctAnswer = questionModel.correctAnswer
        wrongAnswers = questionModel.wrongAnswers
        viewController?.display(data: questionModel)
    }
}
