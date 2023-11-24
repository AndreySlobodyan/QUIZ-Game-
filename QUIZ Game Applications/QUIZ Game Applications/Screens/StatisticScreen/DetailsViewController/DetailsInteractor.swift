//
//  DetailsInteractor.swift
//  QUIZ Game Applications
//
//  Created by mac on 24.11.2023.
//

import Foundation

protocol DetailsBusinesLogic {
    
    func getData()
}

protocol StatisticStoreProtocol: AnyObject {
    
    var dataStatistic: StatisticCellModel? {get set}
}

class DetailsInteractor: StatisticStoreProtocol {
    
    var presenter: DetailsPresenter?
    var dataStatistic: StatisticCellModel?
    
}

extension DetailsInteractor: DetailsBusinesLogic {
    
    func getData() {
        
        presenter?.dispalyData(data: dataStatistic!)
    }
}
