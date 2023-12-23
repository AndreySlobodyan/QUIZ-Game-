//
//  StatisticPresenter.swift
//  QUIZ Game Applications
//
//  Created by mac on 10.11.2023.
//

import Foundation

protocol StatisticScreanLogic {
    
    func displayDataCell(data: [StatisticCellModel])
    func moveItemToTop(index: Int, favorit: Bool)
    func deleteCellData(index: Int)
    func allData()
}
   
class StatisticPresenter {
    
    weak var viewController: StatisticDisplayLogic?
    var statisticDataСell = [StatisticCellModel]()
}

extension StatisticPresenter: StatisticScreanLogic {
    
    func allData() {
        displayDataCell(data: statisticDataСell)
    }
    
    func deleteCellData(index: Int) {
        
        statisticDataСell.remove(at: index)
        displayDataCell(data: statisticDataСell)
    }
    
    func moveItemToTop(index: Int, favorit: Bool) {
   
        statisticDataСell[index].isFavorite = favorit
      displayDataCell(data: statisticDataСell)
    }
    
    func displayDataCell(data: [StatisticCellModel]) {
        
        let favoriteArray = data.filter {$0.isFavorite}.sorted { (model1, model2) -> Bool in
            return model1.surveyDate > model2.surveyDate
        }
        let unFavoriteArayy = data.filter {!$0.isFavorite}.sorted { (model1, model2) -> Bool in
            return model1.surveyDate > model2.surveyDate
        }
        statisticDataСell = favoriteArray + unFavoriteArayy
        viewController?.displayDataCell(data: statisticDataСell)
    }
}
