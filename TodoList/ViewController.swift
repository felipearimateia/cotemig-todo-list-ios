//
//  ViewController.swift
//  TodoList
//
//  Created by Felipe Arimateia on 21/05/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let repository = UserRepository.factory()
        repository.login(email: "mob-felipe@cotemig.com.br", password: "cotemig012")
    }
}

