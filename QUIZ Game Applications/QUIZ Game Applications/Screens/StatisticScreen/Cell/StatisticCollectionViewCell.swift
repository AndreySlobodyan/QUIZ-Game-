//
//  StatisticCollectionViewCell.swift
//  QUIZ Game Applications
//
//  Created by mac on 01.11.2023.
//
import UIKit


class StatisticCollectionViewCell: UITableViewCell {
    
    let categoryLable: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let wrongLable:  UILabel = {
        let label = UILabel()
        label.textColor = .red
        return label
    }()
    
    let correctLable:  UILabel = {
        let label = UILabel()
        label.textColor = .green
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(categoryLable)
        contentView.addSubview(wrongLable)
        contentView.addSubview(correctLable)
        setupLable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLable(){
        
        categoryLable.translatesAutoresizingMaskIntoConstraints = false
        categoryLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        categoryLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        
        wrongLable.translatesAutoresizingMaskIntoConstraints = false
        wrongLable.leadingAnchor.constraint(equalTo: categoryLable.leadingAnchor, constant: 120).isActive = true
        wrongLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        
        correctLable.translatesAutoresizingMaskIntoConstraints = false
        correctLable.leadingAnchor.constraint(equalTo: wrongLable.leadingAnchor, constant: 120).isActive = true
        correctLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
    }
    
    func set(cellData: StatisticCellModel){
    
        categoryLable.text = cellData.category
        wrongLable.text = "Wrong: " + String(cellData.wrongScor)
        correctLable.text = "Correct: " + String(cellData.corectScor)
        contentView.backgroundColor = cellData.isFavorite ? .yellow : nil
    }
}

