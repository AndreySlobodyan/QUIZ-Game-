//
//  MathematicsRouter .swift
//  QUIZ Game Applications
//
//  Created by mac on 24.07.2023.
//

import Foundation
import UIKit
protocol QuestionRoutingLogic {
    func navigateToQuizz()
}

protocol QuestionDataPassing {
    var dataStore: QuestionStoreProtocol? {get}
}

class QuestionRouter: QuestionDataPassing {
    
    weak var viewController: UIViewController?
    weak var dataStore: QuestionStoreProtocol?
}

extension QuestionRouter: QuestionRoutingLogic {
    func navigateToQuizz() {
        let quizzViewController = QuizzCollectionScreenViewController()
        viewController?.navigationController?.pushViewController(quizzViewController, animated: false)
    }
}
