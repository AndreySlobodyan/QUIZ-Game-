//
//  ViewController.swift
//  QUIZ Game Applications
//
//  Created by mac on 13.07.2023.
//

import UIKit

class DashboardScreenTabBarController: UITabBarController {
    
    enum Tab: CaseIterable {
        
        case quizzCollection
        case statisticVC
        case third
        
        var tabImage: UIImage {
            switch self {
            case .quizzCollection:
                return ImageGallery.houseFilITabImage
            case .statisticVC:
                return ImageGallery.pencilSlashTabimage
            case .third:
                return ImageGallery.circleFiliTabimage
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.unselectedItemTintColor = .darkGray
        tabBar.backgroundColor = .lightGray
        view.tintColor = .white
        view.backgroundColor = .lightGray
        
        let tabs = Tab.allCases.map { item in
            let viewController: UIViewController
            switch item {
            case .quizzCollection:
                viewController = UINavigationController(rootViewController: QuizzCollectionScreenViewController())
            case .statisticVC:
                viewController = UINavigationController(rootViewController: StatisticViewController())
            case .third:
                viewController = UIViewController()
            }
            
            viewController.tabBarItem.image = item.tabImage
            return viewController
        }
        
        setViewControllers(tabs, animated: true)
    }
}
