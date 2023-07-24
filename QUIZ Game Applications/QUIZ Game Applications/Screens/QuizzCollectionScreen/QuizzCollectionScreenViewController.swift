//
//  QuizzCollectionScreenViewController.swift
//  QUIZ Game Applications
//
//  Created by mac on 13.07.2023.
//

import Foundation
import UIKit


protocol QuizzDisplayLogic: AnyObject {
    func display(data: [QuizzModell])
}

var quizzCollectionView: UICollectionView!

class QuizzCollectionScreenViewController: UIViewController {
    
    private let cellReuseIdentifier = "Cell"
    
    //MARK: - External Vars
    private(set) weak var router: QuizzRoutingLogic?
    
    //MARK: - Internal Vars
    private var interactor: QuizzBusinessLogic?
    private var dataToDispaly = [QuizzModell]()
   
    
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
        let router = QuizzRouter()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        router.viewController = viewController
        viewController.router = router
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor?.request()
        print(dataToDispaly)
        
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
        quizzCollectionView.register(QuizzCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
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
        return dataToDispaly.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as!
        QuizzCollectionViewCell
        cell.backgroundColor = .lightGray
        cell.layer.cornerRadius = 25
        cell.setupCell(data: dataToDispaly[indexPath.item])
        return cell
       }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    }
}

//MARK: - DisplayLogic

extension QuizzCollectionScreenViewController: QuizzDisplayLogic {
    func display(data: [QuizzModell]) {
        dataToDispaly.removeAll()
        dataToDispaly.append(contentsOf: data)
        
        
    }
    
   
    
}
