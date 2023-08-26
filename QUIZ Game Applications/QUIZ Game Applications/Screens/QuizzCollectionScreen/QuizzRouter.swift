//
//  QuizzRouter.swift
//  QUIZ Game Applications
//
//  Created by mac on 24.07.2023.
//

import Foundation
import UIKit

protocol QuizzRoutingLogic {
    func navigateToDetalis(quizzData: QuizzModell)
    
}

class QuizzRouter {
    
    weak var viewController: UIViewController?
}

extension QuizzRouter: QuizzRoutingLogic {
    
    func navigateToDetalis(quizzData: QuizzModell) {
        let questionViewController = QuestionScreenViewController()
        questionViewController.router?.dataStore?.dataQuestion = quizzData
        viewController?.navigationController?.pushViewController(questionViewController, animated: true)
        
    }
}



