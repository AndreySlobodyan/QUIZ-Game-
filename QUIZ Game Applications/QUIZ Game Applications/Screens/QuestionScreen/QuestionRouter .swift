//
//  MathematicsRouter .swift
//  QUIZ Game Applications
//
//  Created by mac on 24.07.2023.
//

import Foundation
import UIKit

protocol QuestionRoutingLogic {
    
    func navigateToQuizz(dataCorect: Int, dataWrong: Int)
    
    func correctAllertQuestion(completion: @escaping () -> Void)
    
    func wrongAllertQuestion(completion: @escaping () -> Void)
}
  
protocol QuestionDataPassing {
    var dataStore: QuestionStoreProtocol? {get}
}

class QuestionRouter: QuestionDataPassing {
    
    weak var viewController: UIViewController?
    weak var dataStore: QuestionStoreProtocol?
}

extension QuestionRouter: QuestionRoutingLogic {
    func correctAllertQuestion(completion: @escaping () -> Void) {
        let alertController = UIAlertController(title: "Правильный ответ!", message: "Вы ответили верно.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default){ (_) in
            completion()
        }
        alertController.addAction(okAction)
        viewController?.present(alertController, animated: true)
    }
    
    func wrongAllertQuestion(completion: @escaping () -> Void) {
        let alerttController = UIAlertController(title: "Ответ не правильный !", message: "Вы ответили не верно.", preferredStyle: .alert)
        let wrongAction = UIAlertAction(title: "OK", style: .default) { (_) in
            completion()
            }
        alerttController.addAction(wrongAction)
        viewController?.present(alerttController, animated: true)
    }
    
    
    func navigateToQuizz(dataCorect: Int, dataWrong: Int) {
         let alertController = UIAlertController(title: "Score:", message: "Correct: \(dataCorect) Wrong: \(dataWrong)", preferredStyle: .alert)
        let nextAction = UIAlertAction(title: "Сomplete", style: .default){ [weak self] _ in
            let quizzViewController = QuizzCollectionScreenViewController()
            self?.viewController?.navigationController?.pushViewController(quizzViewController, animated: false)
}
        alertController.addAction(nextAction)
        viewController?.present(alertController, animated: true, completion: nil)
    }
}
