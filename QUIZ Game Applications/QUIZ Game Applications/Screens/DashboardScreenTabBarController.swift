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
        case second
        case third
        
    var tabImage: UIImage {
            switch self {
            case .quizzCollection:
                return ImageGallery.houseFilITabImage
            case .second:
                return ImageGallery.pencilSlashTabimage
            case .third:
                return ImageGallery.circleFiliTabimage
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        let tabs = Tab.allCases.map { item in
            let viewController: UIViewController
            switch item {
            case .quizzCollection:
                viewController = UINavigationController(rootViewController: QuizzCollectionScreenViewController())
            case .second:
                viewController = UIViewController()
            case .third:
                viewController = UIViewController()
            }
            
            viewController.tabBarItem.image = item.tabImage
            return viewController
        }
        
        setViewControllers(tabs, animated: true)
    }
}
