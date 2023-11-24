//
//  StatisticViewController.swift
//  QUIZ Game Applications
//
//  Created by mac on 31.10.2023.
//

import UIKit

protocol StatisticDisplayLogic: AnyObject {
    
    func displayDataCell(data: [StatisticCellModel])
}

class StatisticViewController: UIViewController {
    
    private var interactor: StatisticBusinessLogic?
    private(set) var router: StatisticRoutingLogic?
    private var statisticDataСell: [StatisticCellModel] = []
    let tableView: UITableView = {
        let table = UITableView()
        table.register(StatisticCollectionViewCell.self, forCellReuseIdentifier: "StatisticCollectionViewCell")
        return table
    }()
    let segmentedControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["All", "Favorite"])
        segment.selectedSegmentIndex = 0
        segment.backgroundColor = UIColor.lightGray
        segment.tintColor = UIColor.blue
        return segment
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        
        let viewController = self
        let interactor = StatisticInteractor()
        let presenter = StatisticPresenter()
        let router = StatisticRouter()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        router.viewController = viewController
        viewController.router = router
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Statistic"
        self.segmentedControl.addTarget(self, action: #selector(segmentValueChanged), for: .valueChanged)
        setupSegment()
        setupTableView()
        interactor?.getData()
    }
    
    @objc func segmentValueChanged(sender: UISegmentedControl) {
        
        switch segmentedControl.selectedSegmentIndex {
            
        case 0:
            interactor?.getAllData()
        case 1:
            let favoriteData = statisticDataСell.filter { $0.isFavorite }
            statisticDataСell = favoriteData
        default:
            break
        }
        tableView.reloadData()
    }
    
    func setupSegment(){
        
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        segmentedControl.widthAnchor.constraint(equalToConstant: 280).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupTableView() {
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 4).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension StatisticViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        router?.navigateToDetails(data: statisticDataСell[indexPath.item])
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return segmentedControl.selectedSegmentIndex == 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return statisticDataСell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatisticCollectionViewCell", for: indexPath) as! StatisticCollectionViewCell
        cell.selectionStyle = .none
        let cellData = statisticDataСell[indexPath.row]
        cell.set(cellData: cellData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        64
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            
            self.interactor?.delletCell(index: indexPath.row)
            completionHandler(true)
        }
        
        let moreAction = UIContextualAction(style: .normal, title: "⭐️ Favorite") { (action, view, completionHandler) in
            
            let cellData = self.statisticDataСell[indexPath.row]
            self.interactor?.moveFavoriteCell(index: indexPath.row, favorit: !cellData.isFavorite)
            completionHandler(true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, moreAction])
        return configuration
    }
}

extension StatisticViewController: StatisticDisplayLogic {
    func displayDataCell(data: [StatisticCellModel]) {
        statisticDataСell = data
        tableView.reloadData()
    }
}
