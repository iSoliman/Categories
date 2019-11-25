//
//  NetworkManager.swift
//  Categories
//
//  Created by Islam Soliman on 11/25/19.
//  Copyright © 2019 Islam Soliman. All rights reserved.
//

import UIKit

class NetworkManager {

    
    func getList(success: ([String]) -> Void, failure: (String) -> Void) {
        
        
        let categories = ["Animals", "Anime", "Anti-Malware", "Art & Design", "Books"]
        success(categories)
        
    }
}


