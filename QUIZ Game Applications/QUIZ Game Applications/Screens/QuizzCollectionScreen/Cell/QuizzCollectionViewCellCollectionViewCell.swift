//
//  QuizzCollectionViewCellCollectionViewCell.swift
//  QUIZ Game Applications
//
//  Created by mac on 24.07.2023.
//

import UIKit

class QuizzCollectionViewCell: UICollectionViewCell {
    
        
        let label: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.textColor = .black
            return label
            
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.topAnchor.constraint(equalTo: topAnchor).isActive = true
            label.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            label.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setupCell(data: QuizzModell) {
            label.text = data.categories
        }
    }

