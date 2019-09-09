//
//  MenuTableViewController.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 09/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    var dishes: [Dish]? = [
        Dish(
            dishImageName: "british-roast-vegetable-salad-with-stilton",
            dishName: "British Roast Vegetable Salad with Stilton",
            dishDescription: "Chef Dan Holzman of New York City's Meatball Shop crushes his skin-on potatoes right in the saucepan and adds lemon and parsley for terrific flavor.",
            dishPrice: 18.49
        ),
        Dish(
            dishImageName: "crushed-yukon-gold-potatoes-with-lemon",
            dishName: "Crushed Yukon Gold Potatoes with Lemon",
            dishDescription: "Chef Dan Holzman of New York City's Meatball Shop crushes his skin-on potatoes right in the saucepan and adds lemon and parsley for terrific flavor.",
            dishPrice: 24.79
        ),
        Dish(
            dishImageName: "little-gem-lettuce-with-white-anchovies",
            dishName: "Little Gem Lettuce with White Anchovies",
            dishDescription: "Star chef Geoffrey Zakarian's herb-packed salad dressing is brightly flavored, sweet and tangy; it's like green goddess dressing but without the mayonnaise or sour cream.",
            dishPrice: 21.67
        ),
        Dish(
            dishImageName: "roasted-winter-squash-with-vanilla-butter",
            dishName: "Roasted Winter Squash with Vanilla Butter",
            dishDescription: "Star chef Geoffrey Zakarian's herb-packed salad dressing is brightly flavored, sweet and tangy; it's like green goddess dressing but without the mayonnaise or sour cream.",
            dishPrice: 26.74
        ),
        Dish(
            dishImageName: "sautéed-collard-greens-with-pepperoni",
            dishName: "Sautéed Collard Greens with Pepperoni",
            dishDescription: "Collards are often paired with bacon, but our new favorite twist is to flavor the greens with spicy pepperoni.",
            dishPrice: 13.42
        ),
        Dish(
            dishImageName: "warm-mushroom-salad",
            dishName: "Warm Mushroom Salad",
            dishDescription: "Collards are often paired with bacon, but our new favorite twist is to flavor the greens with spicy pepperoni.",
            dishPrice: 11.66
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "MENU"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Insert", style: .plain, target: self, action: "Insert new item to MENU.")
        
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
        if let dishes = dishes {
            return dishes.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MenuTableViewCell else { return UITableViewCell() }
        
        if let dishes = dishes {
            cell.dish = dishes[indexPath.item]
            cell.selectionStyle = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.item).")
    }
}
