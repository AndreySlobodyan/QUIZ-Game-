//
//  QuizzInteractor.swift
//  QUIZ Game Applications
//
//  Created by mac on 16.07.2023.
//

import Foundation

protocol QuizzBusinessLogic {
    
}

class QuizzInteractor{
//MARK: -  InteractorDelegate
    var presenter: QuizzPresentahionLogic?
}

//MARK: - BusinessLogic
extension QuizzInteractor: QuizzBusinessLogic {
    
}
