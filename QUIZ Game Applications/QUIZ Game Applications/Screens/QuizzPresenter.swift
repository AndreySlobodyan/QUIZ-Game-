//
//  QuizzPresenter.swift
//  QUIZ Game Applications
//
//  Created by mac on 16.07.2023.
//

import Foundation

protocol QuizzPresentahionLogic {
      func presentdata()
}


class QuizzPresenter {
//MARK: - PresenterDelegate 
    weak var viewController: QuizzDisplayLogic?
}


//MARK: - PresentahionLogic
extension QuizzPresenter:  QuizzPresentahionLogic {
    func presentdata() {
        
    }
    
    
}
