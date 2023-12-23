//
//  QuizzInteractor.swift
//  QUIZ Game Applications
//
//  Created by mac on 16.07.2023.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift


protocol QuizzBusinessLogic {

    func firData()
}

class QuizzInteractor {
    
//MARK: -  InteractorDelegate
    var presenter: QuizzPresentahionLogic?
    var response = [QuizzBackendModel]()
}

//MARK: - BusinessLogic
extension QuizzInteractor: QuizzBusinessLogic {
    
    func firData() {
        
        let db = Firestore.firestore()
        let docQuesthion = db.collection("quizz").document("questions")
        docQuesthion.getDocument(as: QuizzResponse.self) { result in
            switch result {
                    case .success(let questionsResponse):
                        let questions = Array(questionsResponse.results.values)
                        self.response.append(contentsOf: questions)
                        self.presenter?.present(data: self.response)
                    case .failure(let error):
                        print("Error decoding questions: \(error)")
            }
        }
    }
}




