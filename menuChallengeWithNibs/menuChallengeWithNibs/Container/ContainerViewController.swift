//
//  ContainerViewController.swift
//  menuChallengeWithNibs
//
//  Created by Carlos Mendieta on 4/17/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    enum SlideOutState{
        case collapsed
        case menuPanelExpanded
    }
    
    private var isMenuHidden = true
    private var currentState: SlideOutState = .collapsed
    private var homeViewController = HomeViewController()
    private var menuViewController = MenuViewController()
    private var homeNavigationController : UINavigationController!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationViewController()
        homeViewController.delegate = self
    }
    
    private func setupNavigationViewController(){
        homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.isNavigationBarHidden = true
        view.addSubview(homeNavigationController.view)
        addChild(homeNavigationController)
    }
}

extension ContainerViewController: HomeViewControllerDelegate {
    func toggleMenuPanel() {
        let notAlreadyExpanded = (currentState != .menuPanelExpanded)
        if notAlreadyExpanded {
            addMenuViewController()
        }
        animateMenu(shouldExpand: notAlreadyExpanded)
    }
    
    func collapseSidePanels() {
        toggleMenuPanel()
    }
    
    func addMenuViewController() {
        view.insertSubview(menuViewController.view, at: 0)
        addChild(menuViewController)
        menuViewController.didMove(toParent: self)
        menuViewController.delegate = homeViewController
    }
    
    func animateMenu(shouldExpand: Bool) {
        if shouldExpand{
            currentState = .menuPanelExpanded
            animateCenterPanelXPosition(targetPosition: homeNavigationController.view.frame.width * 0.65)
            
        } else {
            animateCenterPanelXPosition(targetPosition: 0) { finished in
                self.currentState = .collapsed
                self.menuViewController.view.removeFromSuperview()
            }
        }
    }
    
    func animateCenterPanelXPosition(targetPosition: CGFloat, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: 0.35,
                       delay: 0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0,
                       options: .curveEaseInOut, animations: {
                        self.homeNavigationController.view.frame.origin.x = targetPosition
        }, completion: completion)
    }
}
