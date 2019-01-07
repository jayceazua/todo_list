//
//  TodoTableViewController.swift
//  Todo_List
//
//  Created by Jayce Azua on 1/5/19.
//  Copyright © 2019 Jayce Azua. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {
    
    var todoCoreDatas = [TodoCoreData]()
    
    override func viewWillAppear(_ animated: Bool) {
        getTodos()

    }
    
    // getting data from the coredata
    func getTodos() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let todosFromCoreData = try? context.fetch(TodoCoreData.fetchRequest()) {
                if let todos = todosFromCoreData as? [TodoCoreData] {
                    todoCoreDatas = todos
                    tableView.reloadData()
                }
            }
        }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoCoreDatas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let currentTodo = todoCoreDatas[indexPath.row]
        
        if currentTodo.important {
            if let title = currentTodo.title {
                cell.textLabel?.text = "⁉️\(title)"
            }
            
        }
        else {
            cell.textLabel?.text = currentTodo.title
        }

        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentTodo = todoCoreDatas[indexPath.row]
        let selectedTodo = currentTodo
        performSegue(withIdentifier: "moveToComplete", sender: selectedTodo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let createVC = segue.destination as? CreateTodoViewController {
            createVC.todoTableVC = self
        }
        
        
        if let completeVC = segue.destination as? CompleteViewController {
            /*
            if let selectedTodo = sender as? Todo {
                completeVC.todo = selectedTodo
            }
            */
        }
    }
}
