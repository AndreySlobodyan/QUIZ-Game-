//
//  QuizzPresenter.swift
//  QUIZ Game Applications
//
//  Created by mac on 16.07.2023.
//

import Foundation

protocol QuizzPresentahionLogic {
    
    func present(data: [QuizzBackendModel])
}

class QuizzPresenter {
    
//MARK: - PresenterDelegate
    weak var viewController: QuizzDisplayLogic?
}


//MARK: - PresentahionLogic

extension QuizzPresenter:  QuizzPresentahionLogic {
    
    func present(data: [QuizzBackendModel]) {
        let quizzData = data.map { backModel -> QuizzModell in
            
            let quizzModel = QuizzModell(categories: backModel.categories, id: backModel.id)
            return quizzModel
        }
        viewController?.display(data: quizzData)
    }
}
