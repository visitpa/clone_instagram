//
//  ViewController.swift
//  CloneInstagram
//
//  Created by Visit Patcharapanyapong on 6/3/2567 BE.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBarController = TabBarViewController()
        addChild(tabBarController)
        view.addSubview(tabBarController.view)
        tabBarController.didMove(toParent: self)
    }
}
