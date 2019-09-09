//
//  MenuTableViewController.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 09/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "MENU"
        
        tableView.backgroundColor = .white
        
        tableView.separatorStyle = .none
        
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 64.0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: UIView = MenuTableViewHeader()
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MenuTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        
        return cell
    }
}
