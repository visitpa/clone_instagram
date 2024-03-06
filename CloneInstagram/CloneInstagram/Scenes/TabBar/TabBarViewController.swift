//
//  TabBarViewController.swift
//  CloneInstagram
//
//  Created by Visit Patcharapanyapong on 6/3/2567 BE.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    private var previousSelectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        delegate = self
        
        let homeStoryboard = UIStoryboard(name: "HomeViewController", bundle: nil)
        let homeVC = homeStoryboard.instantiateViewController(withIdentifier: "HomeViewController")
        let homeIcon = UIImage(named: "ic_home")
        let resizeHomeIcon = homeIcon?.resized(to: .init(width: 24, height: 24))
        let homeSelectedIcon = UIImage(named: "ic_home_selected")
        let resizeHomeSelectedIcon = homeSelectedIcon?.resized(to: .init(width: 26, height: 26))
        homeVC.tabBarItem = UITabBarItem(title: nil, image: resizeHomeIcon, selectedImage: resizeHomeSelectedIcon)
        
        let homeStoryboard2 = UIStoryboard(name: "HomeViewController", bundle: nil)
        let homeVC2 = homeStoryboard.instantiateViewController(withIdentifier: "HomeViewController")
        let homeIcon2 = UIImage(named: "ic_search")
        let resizeHomeIcon2 = homeIcon2?.resized(to: .init(width: 24, height: 24))
        let homeSelectedIcon2 = UIImage(named: "ic_search_selected")
        let resizeHomeSelectedIcon2 = homeSelectedIcon2?.resized(to: .init(width: 26, height: 26))
        homeVC2.tabBarItem = UITabBarItem(title: nil, image: resizeHomeIcon2, selectedImage: resizeHomeSelectedIcon2)
        
        let homeStoryboard3 = UIStoryboard(name: "HomeViewController", bundle: nil)
        let homeVC3 = homeStoryboard.instantiateViewController(withIdentifier: "HomeViewController")
        let homeIcon3 = UIImage(named: "ic_plus")
        let resizeHomeIcon3 = homeIcon3?.resized(to: .init(width: 24, height: 24))
        let homeSelectedIcon3 = UIImage(named: "ic_plus_selected")
        let resizeHomeSelectedIcon3 = homeSelectedIcon3?.resized(to: .init(width: 26, height: 26))
        homeVC3.tabBarItem = UITabBarItem(title: nil, image: resizeHomeIcon3, selectedImage: resizeHomeSelectedIcon3)
        
        let homeStoryboard4 = UIStoryboard(name: "HomeViewController", bundle: nil)
        let homeVC4 = homeStoryboard.instantiateViewController(withIdentifier: "HomeViewController")
        let homeIcon4 = UIImage(named: "ic_video")
        let resizeHomeIcon4 = homeIcon4?.resized(to: .init(width: 24, height: 24))
        let homeSelectedIcon4 = UIImage(named: "ic_video_selected")
        let resizeHomeSelectedIcon4 = homeSelectedIcon4?.resized(to: .init(width: 26, height: 26))
        homeVC4.tabBarItem = UITabBarItem(title: nil, image: resizeHomeIcon4, selectedImage: resizeHomeSelectedIcon4)
        
        let homeStoryboard5 = UIStoryboard(name: "HomeViewController", bundle: nil)
        let homeVC5 = homeStoryboard.instantiateViewController(withIdentifier: "HomeViewController")
        let homeIcon5 = UIImage(named: "ic_profile")
        let resizeHomeIcon5 = homeIcon5?.resized(to: .init(width: 24, height: 24))
        let homeSelectedIcon5 = UIImage(named: "ic_profile_selected")
        let resizeHomeSelectedIcon5 = homeSelectedIcon5?.resized(to: .init(width: 26, height: 26))
        homeVC5.tabBarItem = UITabBarItem(title: nil, image: resizeHomeIcon5, selectedImage: resizeHomeSelectedIcon5)
        
        let topLine = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 1))
        topLine.backgroundColor = .gray.withAlphaComponent(0.01)
        tabBar.addSubview(topLine)
        tabBar.tintColor = .black
        viewControllers = [homeVC, homeVC2, homeVC3, homeVC4, homeVC5]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tabBarController(self, didSelect: viewControllers?[0] ?? UIViewController())
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let previousItemView = tabBarController.tabBar.items?[previousSelectedIndex].value(forKey: "view") as? UIView {
            removeRedDot(from: previousItemView)
        }
        
        if let selectedItemView = tabBarController.tabBar.selectedItem?.value(forKey: "view") as? UIView {
            addRedDot(to: selectedItemView)
            previousSelectedIndex = tabBarController.selectedIndex
        }
    }
    
    func addRedDot(to view: UIView) {
        removeRedDot(from: view)
        
        let dotSize: CGFloat = 4
        let dot = UIView(frame: CGRect(x: view.bounds.width / 2 - dotSize / 2, y: view.bounds.height - dotSize / 2, width: dotSize, height: dotSize))
        dot.backgroundColor = UIColor.red
        dot.layer.cornerRadius = dotSize / 2
        dot.tag = 100
        
        view.addSubview(dot)
    }
    
    func removeRedDot(from view: UIView) {
        for subview in view.subviews {
            if subview.tag == 100 {
                subview.removeFromSuperview()
            }
        }
    }
}
