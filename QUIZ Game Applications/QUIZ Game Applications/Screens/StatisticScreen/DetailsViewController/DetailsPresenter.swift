//
//  DetailsPresenter.swift
//  QUIZ Game Applications
//
//  Created by mac on 24.11.2023.
//

import Foundation

protocol DetailsPresenterLogic {
    
    func dispalyData(data: StatisticCellModel )
}

class DetailsPresenter {
    
    weak var viewController: DetailsViewController?
}

extension DetailsPresenter: DetailsPresenterLogic {
    
    func dispalyData(data: StatisticCellModel) {
        
        let detailsData = DeatailsModel(category: data.category, question: data.question, answer: data.answer)
        viewController?.dispaly(data: detailsData)
    }
}

