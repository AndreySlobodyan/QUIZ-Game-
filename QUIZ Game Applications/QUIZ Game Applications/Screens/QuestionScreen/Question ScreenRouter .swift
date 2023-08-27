//
//  MathematicsRouter .swift
//  QUIZ Game Applications
//
//  Created by mac on 24.07.2023.
//

import Foundation

protocol QuestionRoutingLogic {
    
}

protocol QuestionDataPassing {
    
    var dataStore: QuestionStoreProtocol? {get}
}

class QuestionRouter: QuestionDataPassing {
    
   weak var dataStore: QuestionStoreProtocol?
    
}

extension QuestionRouter: QuestionRoutingLogic {
    
}
