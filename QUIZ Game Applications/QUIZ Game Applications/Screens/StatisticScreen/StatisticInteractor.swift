//
//  StatisticInteractor.swift
//  QUIZ Game Applications
//
//  Created by mac on 10.11.2023.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol StatisticBusinessLogic {
    
    func getData() async throws
    func moveFavoriteCell(index: Int, favorit: Bool)
    func delletCell(index: Int)
    func getAllData()
    func dataUpdates()
    func deleteData(document: String)
    func favoriteUpdates(document: String, isFavorite: Bool)
}

class StatisticInteractor {
    
    var presenter: StatisticScreanLogic?
    var statisticData = [StatisticCellModel]()
}

extension StatisticInteractor: StatisticBusinessLogic {
    
    func favoriteUpdates(document: String, isFavorite: Bool) {
        
        let db = Firestore.firestore()
        let newFavoriteStatus = !isFavorite
        db.collection("statistic").document(document).updateData([
            "isFavorite": newFavoriteStatus
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated. New isFavorite status: \(newFavoriteStatus)")
            }
        }
    }
    
    func deleteData(document: String) {
        
        let db = Firestore.firestore()
        db.collection("statistic").document(document).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    
    func dataUpdates() {
        statisticData.removeAll()
    }
    
    func getAllData() {
        presenter?.allData()
    }
    
    func delletCell(index: Int) {
        presenter?.deleteCellData(index: index)
    }
    
    func moveFavoriteCell(index: Int, favorit: Bool) {
        presenter?.moveItemToTop(index: index, favorit: favorit)
    }
    
    func getData() async throws {
        
        let db = Firestore.firestore().collection("statistic")
        let snapShot = try await db.getDocuments()
        
        for document in snapShot.documents {
            
            let statistic = try document.data(as: StatisticCellModel.self)
            statisticData.append(statistic)
            presenter?.displayDataCell(data: statisticData)
            
        }
    }
}

