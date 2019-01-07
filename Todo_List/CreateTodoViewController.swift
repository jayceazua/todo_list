//
//  CreateTodoViewController.swift
//  Todo_List
//
//  Created by Jayce Azua on 1/5/19.
//  Copyright © 2019 Jayce Azua. All rights reserved.
//

import UIKit

class CreateTodoViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitchField: UISwitch!
    
    var todoTableVC: TodoTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addAction(_ sender: Any) {
        let newTodo = Todo()
        newTodo.important = importantSwitchField.isOn
        
        if let title = titleTextField.text {
            newTodo.title = title
        }
        
        todoTableVC?.todos.append(newTodo)
        todoTableVC?.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    

}
