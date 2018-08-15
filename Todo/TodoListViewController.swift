//
//  ViewController.swift
//  Todo
//
//  Created by Daisymond on 8/3/18.
//  Copyright © 2018 Daisymond. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [ "find mike", "buy eggos", "kill the demon" ]
    
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
    // MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // What will happen once the user clicks the add button on our UIAlert
           
           self.itemArray.append(textField.text!)
        self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            // in here alertTextField is a local variable only accessible in this function, so for us to beable to trigger an action that grabs the text in the alertTextfield, in the action func,
            // we create another textfield called textField at the begining og the addButtonPressed func which will be global, the we assign our original alertTextField to it. now we can perfom
            // an action. good piece of skill.
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
            print(alertTextField.text)
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

