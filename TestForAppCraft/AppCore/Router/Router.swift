//
//  Router.swift
//  TestForAppCraft
//
//  Created by Максим Вечирко on 16.01.2021.
//

import UIKit

protocol Router {
    var passingData: Any? {get set}
    var controller: UINavigationController? {get set}
    func route()
    func routeToFeatured()
    func routeToLocation()
}

extension Router {
    var passingData: Any? {
        return nil
    }
    
    func routeToFeatured() {
        
    }
    
    func routeToLocation() {
        
    }
    
}


