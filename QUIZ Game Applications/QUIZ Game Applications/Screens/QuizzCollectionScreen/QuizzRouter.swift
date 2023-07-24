//
//  QuizzRouter.swift
//  QUIZ Game Applications
//
//  Created by mac on 24.07.2023.
//

import Foundation
import UIKit

protocol QuizzRoutingLogic: AnyObject {
    func navigateToDetalis()
}

class QuizzRouter {
    weak var viewController: UIViewController?
}

extension QuizzRouter: QuizzRoutingLogic {
    func navigateToDetalis() {
    
    }
    
    
}
