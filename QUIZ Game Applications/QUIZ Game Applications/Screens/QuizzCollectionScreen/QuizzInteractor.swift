//
//  QuizzInteractor.swift
//  QUIZ Game Applications
//
//  Created by mac on 16.07.2023.
//

import Foundation

protocol QuizzBusinessLogic {
    func request()
}

class QuizzInteractor {
//MARK: -  InteractorDelegate
    var presenter: QuizzPresentahionLogic?
}

//MARK: - BusinessLogic
extension QuizzInteractor: QuizzBusinessLogic {
    func request() {
        var response = [QuizzBackendModel]()
        let responceData = QuizzBackendModel(categories:"Mathematics" , id: 1)
        let responceData1 = QuizzBackendModel(categories:"Physics" , id: 2)
        let responceData2 = QuizzBackendModel(categories:"Biology" , id: 3)
        let responceData3 = QuizzBackendModel(categories:"Geography" , id: 4)
        response.append(responceData)
        response.append(responceData1)
        response.append(responceData2)
        response.append(responceData3)
        
        presenter?.present(data: response)
    }
    
}
