//
//  CompleteViewController.swift
//  Todo_List
//
//  Created by Jayce Azua on 1/5/19.
//  Copyright © 2019 Jayce Azua. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var todo: Todo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*if let theTodo = todo {
         titleLabel.text = theTodo.title
         } */
        
        titleLabel.text = todo?.title // shorthand code for above
        
        if let todo = todo {
            if todo.important {
                if let title = todo.title {
                    titleLabel.text = "⁉️\(title)"
                }
            }
            else {
                titleLabel.text = todo.title
            }
        }
    }
    
    @IBAction func completeAction(_ sender: Any) {
        // delete todo
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let todo = todo {
                context.delete(todo)
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
        // pop back
        navigationController?.popViewController(animated: true)
        
    }
    
}
