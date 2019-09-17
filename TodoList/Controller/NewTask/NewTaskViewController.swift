//
//  NewTaskViewController.swift
//  TodoList
//
//  Created by Felipe Arimateia on 20/08/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private let userRepository = UserRepository.factory()
    private let taskRepository = TaskRepository.factory()
    private let projectRepository = ProjectRepository.factory()
    
    @IBOutlet weak var textFieldTask: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var projects: Array<ProjectResponse> = []
    private var projectSelected: Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.isOpaque = true
        getProjects()
    }
    
    private func getProjects() {
        projectRepository.getProjects(token: userRepository.getToken()!) { result in
            if result.count > 0 {
                self.projects = result
                self.collectionView.reloadData()
            }
        }
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveTask(_ sender: Any) {
        if let indexProject = projectSelected {
            let project = projects[indexProject]
            let task = textFieldTask.text
            
            //TODO salvar task
            
        } else {
            //TODO mostrar mensagem para selecionar o projeto
        }
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return projects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_project", for: indexPath) as! ProjectsCollectionViewCell
        let project = projects[indexPath.row]
        cell.bind(project: project)
        
        if indexPath.row == projectSelected {
            cell.backgroundColor = .blue
        } else {
            cell.backgroundColor = .clear
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        projectSelected = indexPath.row
        collectionView.reloadData()
    }
}
