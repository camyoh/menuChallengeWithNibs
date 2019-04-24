//
//  HomeViewController.swift
//  menuChallengeWithNibs
//
//  Created by Carlos Mendieta on 4/17/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import UIKit

protocol HomeViewControllerDelegate {
    func toggleMenuPanel()
    func collapseSidePanels()
}

class HomeViewController: UIViewController {
    
    var delegate: HomeViewControllerDelegate!
    private var homeViewModel = HomeViewModel()
    private var option = 0
    @IBOutlet weak var eventsTableView: UITableView!
    
    @IBAction func menuTapped(_ sender: Any) {
        delegate.toggleMenuPanel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibName = UINib(nibName: "HomeTableViewCell", bundle: nil)
        eventsTableView.register(nibName, forCellReuseIdentifier: "HomeTableViewCell")
        eventsTableView.layoutMargins = UIEdgeInsets.zero
        eventsTableView.separatorInset = UIEdgeInsets.zero
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eventCell = eventsTableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        let event = homeViewModel.getEvent(index: indexPath.row)
        eventCell.setupCellFor(event: event, option: option, randomNumber: homeViewModel.arrayWithRandomNumbers[indexPath.row])
        return eventCell
    }
}

extension HomeViewController: MenuViewControllerDelegate {
    func didSelectOption(_ option: Int) {
        self.option = option
        eventsTableView.reloadData()
        delegate.collapseSidePanels()
    }
}
