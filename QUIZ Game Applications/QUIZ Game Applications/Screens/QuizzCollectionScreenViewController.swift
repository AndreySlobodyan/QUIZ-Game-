//
//  QuizzCollectionScreenViewController.swift
//  QUIZ Game Applications
//
//  Created by mac on 13.07.2023.
//

import Foundation
import UIKit


protocol QuizzDisplayLogic: AnyObject {
    func displayData()
}

var quizzCollectionView: UICollectionView!

class QuizzCollectionScreenViewController: UIViewController {
    
    private let categories = ["Mathematics", "Physics", "Biology", "Geography"]
    private let cellReuseIdentifier = "Cell"
    
    
    
    private var interactor: QuizzBusinessLogic?
    
    
    // MARK: - Dependency Injection
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup(){
        let viewController = self
        let interactor = QuizzInteractor()
        let presenter = QuizzPresenter()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupCollectionView()
    }
    
    func setupCollectionView(){
        
        quizzCollectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        view.addSubview(quizzCollectionView)
        quizzCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            quizzCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            quizzCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            quizzCollectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            quizzCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        quizzCollectionView.dataSource = self
        quizzCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
    }
    
    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 128, height: 128)
        layout.minimumLineSpacing = 32
        layout.sectionInset = .init(top: 64, left: 32, bottom: 32, right: 32)
        
        return layout
    }
    
}

//MARK: - CollectionViewDataSource, UICollectionViewDelegate
extension QuizzCollectionScreenViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath)
                cell.backgroundColor = .lightGray
                cell.layer.cornerRadius = 25
                let label = UILabel(frame: cell.contentView.bounds)
                label.textAlignment = .center
                label.text = categories[indexPath.item]
                label.textColor = .black
                cell.contentView.addSubview(label)
                return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    }
}

//MARK: - DisplayLogic

extension QuizzCollectionScreenViewController: QuizzDisplayLogic {
    func displayData() {
        
    }
    
}
