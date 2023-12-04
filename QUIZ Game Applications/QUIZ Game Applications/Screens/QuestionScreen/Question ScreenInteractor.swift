//
//  MathematicsInteractor.swift
//  QUIZ Game Applications
//
//  Created by mac on 24.07.2023.
//

import Foundation

protocol QuestionBusinessLogic {
    
    func request()
    func moveToNextQuestion()
    func answerDidSelect(someAnswer: String)
}

protocol QuestionStoreProtocol: AnyObject {
    
    var dataQuestion: QuizzModell? {get set}
}


class QuestionInteractor: QuestionStoreProtocol {
    
    var dataQuestion: QuizzModell?
    //MARK: -  InteractorDelegate
    var presenter: QuestionPresentahionLogic?
}

extension QuestionInteractor: QuestionBusinessLogic {
    func answerDidSelect(someAnswer: String) {
        presenter?.answerLogic(selected: someAnswer)
    }
    
 func request() {
        
        guard let unwrappedDataQuestion = dataQuestion else {return}
        let responceData = [QuestionModel(id: 1, question: "2 + 2 = ?", correctAnswer: "4", wrongAnswers: ["3", "5", "6"]),
        QuestionModel(id: 1, question: "6 + 6 = ?", correctAnswer: "12", wrongAnswers: ["14","13","9"]),
        QuestionModel(id: 1, question: "15 + 12 = ?", correctAnswer: "27", wrongAnswers: ["23","21","28"]),
        QuestionModel(id: 1, question: "6 + 6 = ?", correctAnswer: "12", wrongAnswers: ["8","11","12"]),
        QuestionModel(id: 1, question: "8 + 8 = ?", correctAnswer: "16", wrongAnswers: ["12","14","16"])]
        let responceData1 = [QuestionModel(id: 2, question: "Какой термометр появился первым?", correctAnswer: "A", wrongAnswers: ["B", "C", "D"])]
        let responceData2 = [QuestionModel(id: 3, question: "Что изучает ботаника?", correctAnswer: "B", wrongAnswers: ["A", "C", "D"])]
        let responceData3 = [QuestionModel(id: 4, question: "Как называются пять океанов мира?", correctAnswer: "C", wrongAnswers: ["D", "B", "A"])]
        let allQuestionData = responceData + responceData1 + responceData2 + responceData3
        let test = QuizzDataModel(quizzModel: unwrappedDataQuestion, questionModel: allQuestionData)
        presenter?.present(data: test)
    }
    
    func moveToNextQuestion() {
        presenter?.questionLogic()
    }
}


