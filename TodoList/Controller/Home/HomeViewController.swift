//
//  HomeViewController.swift
//  TodoList
//
//  Created by Felipe Arimateia on 05/08/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITabBarDelegate {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var imageProfiler: UIImageView!
    
    var imagePicker: ImagePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar?.selectedItem = tabBar.items![0] as UITabBarItem
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
//        imageProfiler.makeRounded()
    }
    
    
    // MARK: - UITabBarDelegate
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func openNewTask(_ sender: Any) {
        if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "newTask") {
            viewController.modalPresentationStyle = .overCurrentContext
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func openImagePicker(_ sender: UIView) {
        self.imagePicker?.present(from: sender)
    }
}

extension HomeViewController: ImagePickerDelegate {
    
    func didSelect(image: UIImage?) {
        self.imageProfiler?.image = image?.circle
    }
}
