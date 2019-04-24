//
//  MenuViewController.swift
//  menuChallengeWithNibs
//
//  Created by Carlos Mendieta on 4/17/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import UIKit

protocol MenuViewControllerDelegate {
    func didSelectOption(_ option: Int)
}

class MenuViewController: UIViewController {
    let menuViewModel = MenuViewModel()
    var delegate: MenuViewControllerDelegate!
    var options: [String]!
    @IBOutlet weak var optionsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibName = UINib(nibName: "MenuTableViewCell", bundle: nil)
        optionsTableView.register(nibName, forCellReuseIdentifier: "MenuTableViewCell")
        optionsTableView.rowHeight = 44
        optionsTableView.reloadData()
    }
}

extension MenuViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuViewModel.options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = optionsTableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        cell.optionLabel.text = menuViewModel.options[indexPath.row]
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 0.154821068, green: 0.1740432382, blue: 0.1897847056, alpha: 1)
        cell.selectedBackgroundView = backgroundView
        
        return cell
    }
}

// MARK: Table View Delegate`
extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didSelectOption(indexPath.row)
    }
}
