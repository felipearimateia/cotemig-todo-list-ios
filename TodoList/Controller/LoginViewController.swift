//
//  LoginViewController.swift
//  TodoList
//
//  Created by Felipe Arimateia on 02/07/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var textFieldEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldEmail?.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor(red:0.81, green:0.81, blue:0.81, alpha:1.0), thickness: 1)

    }
    
    
}

