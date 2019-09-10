//
//  ProjectRepository.swift
//  TodoList
//
//  Created by Felipe Arimateia on 09/09/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import Foundation

class ProjectRepository {
    private let projectApi: ProjectApi
    
    init(_ projectApi: ProjectApi) {
        self.projectApi = projectApi
    }
    
    func getProjects(token: String, completion: @escaping([ProjectResponse]) -> Void) {
        projectApi.getProjects(token: token) { result in
            switch result {
            case .success(let projects):
                completion(projects)
            case .failure:
                completion([])
            }
        }
    }
    
    static func factory() -> ProjectRepository {
        let network = NetworkManager()
        let api = ProjectApi(network: network)
        return ProjectRepository(api)
    }
}
