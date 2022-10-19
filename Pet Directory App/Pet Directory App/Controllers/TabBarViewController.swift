//
//  TabBarViewController.swift
//  Pet Directory App
//
//  Created by Mac on 19/10/2022.
//

import UIKit

//MARK: - The TabBars
class TabBarViewController: UITabBarController {
    
    let controllers = UITabBarController()
    let firstVC = UINavigationController(rootViewController: HomeViewController())
    let secondVC = UINavigationController(rootViewController: SecondViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        view.backgroundColor = .white
    }
    //MARK: - Setting the images and the title for the tabBars
    func setupViewControllers() {
        let vcIcons = [
            UIImage(named: "cathead"),
            UIImage(named: "like")
        ]
        firstVC.title = "All cats"
        secondVC.title = "Cats I like"
        
        setViewControllers([firstVC, secondVC], animated: true)
        tabBar.tintColor = UIColor.black
        tabBar.unselectedItemTintColor = UIColor.gray
        tabBar.backgroundColor = UIColor.white
        
        //MARK: - Iterating through the tabBars to set the images
        guard let icons = self.tabBar.items else { return }
        for icon in 0...1 {
            icons[icon].image = vcIcons[(icon)]
        }
    }
}
