//
//  DetailRouter.swift
//  TestForAppCraft
//
//  Created by Максим Вечирко on 16.01.2021.
//

import UIKit

class DetailRouter: Router {
    var passingData: Any?
    var controller: UINavigationController?
    
    init(passingData: String, controller: UINavigationController) {
        self.passingData = passingData
        self.controller = controller
    }
    
    func route() {
        guard let imageUrl = passingData as? String else {return}
        let storyboard = UIStoryboard(name: StoryboardIdentifier.Main, bundle: nil)
        let view = storyboard.instantiateViewController(identifier: ControllerIdentifier.zoomImageViewController) as! ZoomImageViewController
        let presenter = ZoomImagePresenter(imageUrl: imageUrl)
        view.presenter = presenter
        controller?.pushViewController(view, animated: true)
    }
    
    
}
