//
//  MathematicsInteractor.swift
//  QUIZ Game Applications
//
//  Created by mac on 24.07.2023.
//

import Foundation

protocol QuestionBusinessLogic {
   func request()
       
   
}

protocol QuestionStoreProtocol: AnyObject {
    var dataQuestion: QuizzModell? {get set}
}


class QuestionInteractor: QuestionStoreProtocol {
    
   
    var dataQuestion: QuizzModell?
   
//MARK: -  InteractorDelegate
      var presenter: QuestionPresentahionLogic?
}


extension QuestionInteractor: QuestionBusinessLogic{
       
    func request() {
    guard let unwrappedDataQuestion = dataQuestion else {return}
                
    var response = [QuestionModel]()
        let responceData = QuestionModel(id: 1, question: "2 + 2 = ?", correctAnswer: "4", wrongAnswers: ["3", "5", "6"])
        let responceData1 = QuestionModel(id: 2, question: "Какой термометр появился первым?", correctAnswer: "A", wrongAnswers: ["B", "C", "D"])
        let responceData2 = QuestionModel(id: 3, question: "Что изучает ботаника?", correctAnswer: "B", wrongAnswers: ["A", "C", "D"])
        let responceData3 = QuestionModel(id: 4, question: "Как называются пять океанов мира?", correctAnswer: "C", wrongAnswers: ["D", "B", "A"])
                
                response.append(responceData)
                response.append(responceData1)
                response.append(responceData2)
                response.append(responceData3)
                
        
      
                
       
        
        
                let test = QuizzDataModel(quizzModel: unwrappedDataQuestion, questionModel: response)

                presenter?.present(data: test)
                
                
               
                }
            }
        

