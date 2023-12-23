//
//  MathematicsInteractor.swift
//  QUIZ Game Applications
//
//  Created by mac on 24.07.2023.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol QuestionBusinessLogic {
    
    func saveQuestion(data: String)
    func saveDataQuestion(wrongScore: Int, correctScore: Int, category: String)
    func request()
    func moveToNextQuestion()
    func answerDidSelect(someAnswer: String)
    
}

protocol QuestionStoreProtocol: AnyObject {
    
    var dataQuestion: QuizzModell? {get set}
}


class QuestionInteractor: QuestionStoreProtocol {
    
    let currentDate: Double = Date().timeIntervalSince1970
    var questionSave: [String] = []
    var answerSave: [String] = []
    var dataQuestion: QuizzModell?
    var responce = [QuestionModel]()
    //MARK: -  InteractorDelegate
    var presenter: QuestionPresentahionLogic?
}

extension QuestionInteractor: QuestionBusinessLogic {
    
    func saveQuestion(data: String) {
        
        questionSave.append(data)
    }
    
    func saveDataQuestion(wrongScore: Int, correctScore: Int, category: String) {
        
        let db = Firestore.firestore()
        let statistic = StatisticBackend(category: category, wrongScor: wrongScore, corectScor: correctScore, isFavorite: false, documentID: " ", answer: answerSave, question: questionSave, surveyDate: currentDate )
        
        do {
            let documentReference = try db.collection("statistic").addDocument(from: statistic)
            
            let updatedStatistic = StatisticBackend(category: category, wrongScor: wrongScore, corectScor: correctScore, isFavorite: false, documentID: documentReference.documentID, answer: answerSave, question: questionSave, surveyDate: currentDate)
            
            try db.collection("statistic").document(documentReference.documentID).setData(from: updatedStatistic)
        } catch let error {
            print("Error writing statisctic to Firestore: \(error)")
        }
    }
    
    func answerDidSelect(someAnswer: String) {
        answerSave.append(someAnswer)
        presenter?.answerLogic(selected: someAnswer)
    }
    
    func request() {
        
        let db = Firestore.firestore()
        let docQuizz = db.collection("quizz").document("questionsAnswers")
        docQuizz.getDocument(as: QuestionResponse.self){ result in
            
            switch result {
                
            case .success(let quizzResponse):
                let quizz = Array(quizzResponse.results.values)
                guard let unwrappedDataQuestion = self.dataQuestion else { return }
                let dataQuestion = QuizzDataModel(quizzModel: unwrappedDataQuestion, questionModel: quizz)
                self.presenter?.present(data: dataQuestion)
                
            case .failure(let error):
                print("Error decoding questions: \(error)")
            }
        }
    }
    
    func moveToNextQuestion() {
        presenter?.questionLogic()
    }
}


