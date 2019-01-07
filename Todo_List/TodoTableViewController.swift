//
//  TodoTableViewController.swift
//  Todo_List
//
//  Created by Jayce Azua on 1/5/19.
//  Copyright © 2019 Jayce Azua. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {
    
    var todos = [Todo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let currentTodo = todos[indexPath.row]
        
        if currentTodo.important {
            cell.textLabel?.text = "⁉️\(currentTodo.title)"
        }
        else {
            cell.textLabel?.text = currentTodo.title
        }

        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentTodo = todos[indexPath.row]
        let selectedTodo = currentTodo
        performSegue(withIdentifier: "moveToComplete", sender: selectedTodo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let createVC = segue.destination as? CreateTodoViewController {
            createVC.todoTableVC = self
        }
        
        
        if let completeVC = segue.destination as? CompleteViewController {
            if let selectedTodo = sender as? Todo {
                completeVC.todo = selectedTodo
            }
        }
        //
    }
}
