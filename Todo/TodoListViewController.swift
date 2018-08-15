//
//  ViewController.swift
//  Todo
//
//  Created by Daisymond on 8/3/18.
//  Copyright © 2018 Daisymond. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let itemArray = [ "find mike", "buy eggos", "kill the demon" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    // MARK - Table View Data source methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    // Mark - Table View Delegates Methods
    
    // returns the selected row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
               tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
            
        else {
               tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
       tableView.deselectRow(at: indexPath, animated: true)
    }
}

