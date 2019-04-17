//
//  ContainerViewController.swift
//  menuChallengeWithNibs
//
//  Created by Carlos Mendieta on 4/17/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    private var homeViewController = HomeViewController()
    private var homeNavigationController : UINavigationController!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationViewController()
    }
    
    private func setupNavigationViewController(){
        homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.isNavigationBarHidden = true
        view.addSubview(homeNavigationController.view)
        addChild(homeNavigationController)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
