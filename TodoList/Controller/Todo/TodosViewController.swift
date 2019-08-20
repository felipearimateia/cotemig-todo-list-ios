//
//  HomeViewController.swift
//  TodoList
//
//  Created by Felipe Arimateia on 05/08/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import UIKit

class TodosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellReuseIdentifier = "todo_cell"
    let taskRepository = TaskRepository.factory()
    var tasks: Array<TaskResponse> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskRepository.getTasksByProject("4d8kbl18bisli1dcn1to4e") { (tasks, success) in
            if let items = tasks {
                self.tasks = items
                self.tableView?.reloadData()
            }
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 14
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! TodoTableViewCell
        let task = tasks[indexPath.section]
        
        // add border and color
        cell.backgroundColor = UIColor.white
        cell.layer.borderWidth = 0
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
        cell.lblTitle.text = task.description
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
