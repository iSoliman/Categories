//
//  CategoryPresenter.swift
//  Categories
//
//  Created by Islam Soliman on 11/25/19.
//  Copyright © 2019 Islam Soliman. All rights reserved.
//

import UIKit

class CategoryPresenter: NSObject {
    
    weak var scene: CategoryViewProtocol?
    var categories = [String]()
    let service: NetworkManager
    
    init(scene: CategoryViewProtocol, service: NetworkManager = NetworkManager()) {
        
        self.scene = scene
        self.service = service
    }
    
    func loadCategories() {
        
        service.getList(success: { [weak self] (categories) in
            
            self?.categories = categories
            self?.scene?.categoriesDidLoadSuccessfully(categories)
        }) { [weak self] (errorMsg) in
            
            scene?.errorCallingAPI(errorMsg: errorMsg)
        }
    }

}
