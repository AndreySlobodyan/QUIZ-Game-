//
//  StatisticInteractor.swift
//  QUIZ Game Applications
//
//  Created by mac on 10.11.2023.
//

import Foundation

protocol StatisticBusinessLogic {
    
    func getData()
    func moveFavoriteCell(index: Int, favorit: Bool)
    func delletCell(index: Int)
    func getAllData()
}

class StatisticInteractor {
    
    var presenter: StatisticScreanLogic?
}

extension StatisticInteractor: StatisticBusinessLogic {
    
    func getAllData() {
        presenter?.allData()
    }
    
    func delletCell(index: Int) {
        presenter?.deleteCellData(index: index)
    }
    
    func moveFavoriteCell(index: Int, favorit: Bool) {
        presenter?.moveItemToTop(index: index, favorit: favorit)
    }
    
    func getData() {
        
        var DataCell = [StatisticCellModel]()
        let respoce1 = StatisticCellModel(category: "Mathematics:", wrongScor: 2, corectScor: 3, Surveydate: 23.08, isFavorite: false, question: ["2 + 2 = ?", "6 + 6 = ?", "15 + 12 = ?","6 + 6 = ?","8 + 8 = ?"], answer: ["4","12","27","11","16"])
        let respoce2 = StatisticCellModel(category: "Physics:", wrongScor: 1, corectScor: 4, Surveydate: 22.08, isFavorite: false, question: ["Какой термометр появился первым?"], answer: ["C"])
        let respoce3 = StatisticCellModel(category: "Biology:", wrongScor: 5, corectScor: 4, Surveydate: 21.08, isFavorite: false, question: ["Что изучает ботаника?"], answer: ["B"])
        let respoce4 = StatisticCellModel(category: "Geography:", wrongScor: 2, corectScor: 1, Surveydate: 25.08, isFavorite: false, question: ["Как называются пять океанов мира?"], answer: ["B"])
        DataCell.append(respoce1)
        DataCell.append(respoce2)
        DataCell.append(respoce3)
        DataCell.append(respoce4)
        presenter?.displayDataCell(data: DataCell)
    }
}
