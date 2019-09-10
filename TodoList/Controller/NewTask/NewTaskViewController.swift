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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func saveTask(_ sender: Any) {
    }
    
    // MARK: - UICO
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return projects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_project", for: indexPath) as! ProjectsCollectionViewCell
        let project = projects[indexPath.row]
        cell.bind(project: project)
        return cell
    }
}
