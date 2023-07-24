//
//  ViewController.swift
//  QUIZ Game Applications
//
//  Created by mac on 13.07.2023.
//

import UIKit

class DashboardScreenTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
       
        
        view.backgroundColor = .gray
        
        let vc1 = UINavigationController(rootViewController: QuizzCollectionScreenViewController())
        let vc2 = UIViewController()
        let vc3 = UIViewController()
        vc3.tabBarItem.image = UIImage(systemName: "equal.circle.fill")
        vc2.tabBarItem.image = UIImage(systemName: "pencil.slash")
        vc1.tabBarItem.image = UIImage(systemName: "house.fill")

        setViewControllers([vc1, vc2, vc3], animated: true)
        
        
        
        
    }


}
