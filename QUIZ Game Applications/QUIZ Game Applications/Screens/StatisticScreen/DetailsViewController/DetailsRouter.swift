//
//  detailsRouter.swift
//  QUIZ Game Applications
//
//  Created by mac on 24.11.2023.
//

import Foundation
import UIKit

protocol DetailsRoutingLogic {
    
}

protocol DetailsDtaPassing {
    
    var dataStore: StatisticStoreProtocol? {get}
}

class DetailsRouter: DetailsDtaPassing {
    
    weak var viewController: UIViewController?
    weak var dataStore: StatisticStoreProtocol?
}

extension DetailsRouter: DetailsRoutingLogic {
    
}
