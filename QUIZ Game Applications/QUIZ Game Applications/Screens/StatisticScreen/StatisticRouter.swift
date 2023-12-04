//
//  StatisticRouter.swift
//  QUIZ Game Applications
//
//  Created by mac on 24.11.2023.
//

import Foundation
import UIKit

protocol StatisticRoutingLogic {
    func navigateToDetails(data: StatisticCellModel)
}

class StatisticRouter {
    
    weak var viewController: UIViewController?
}

extension StatisticRouter: StatisticRoutingLogic {
   
    func navigateToDetails(data: StatisticCellModel) {
        
        let detailsVC = DetailsViewController()
        detailsVC.router?.dataStore?.dataStatistic = data
        viewController?.navigationController?.pushViewController(detailsVC, animated: false)
    }
}
