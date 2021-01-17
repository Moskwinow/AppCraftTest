//
//  MainRouter.swift
//  TestForAppCraft
//
//  Created by Максим Вечирко on 16.01.2021.
//

import UIKit
import CoreLocation
class MainRouter: Router {
    
    var passingData: Any?
    
    var controller: UINavigationController?

    init(passingData: Albums? = nil, controller: UINavigationController) {
        self.passingData = passingData
        self.controller = controller
    }
    
    func route() {
        let storyboadr = UIStoryboard(name: StoryboardIdentifier.Main, bundle: nil)
        let vc = storyboadr.instantiateViewController(identifier: ControllerIdentifier.detailViewController) as! DetailViewController
        guard let albums = passingData as? Albums else  {return}
        vc.title = "Альбом \(albums.id)"
        let presenter = DetailPresenter(requestFactory: RequestFactory(), output: vc, albumsModel: albums)
        vc.presenter = presenter
        controller?.pushViewController(vc, animated: true)
    }
    
    func routeToFeatured() {
        let storyboadr = UIStoryboard(name: StoryboardIdentifier.Main, bundle: nil)
        let vc = storyboadr.instantiateViewController(identifier: ControllerIdentifier.featuredViewController) as! FeaturedViewController
        let presenter = FeaturedPresenter(coreAlbums: CoreDataManager.shared.fetch(CoreAlbums.self))
        vc.title = "Избранное"
        vc.navigationItem.rightBarButtonItem = .none
        vc.presenter = presenter
        controller?.pushViewController(vc, animated: true)
    }
    
    func routeToLocation() {
        let storyboadr = UIStoryboard(name: StoryboardIdentifier.Main, bundle: nil)
        let vc = storyboadr.instantiateViewController(identifier: ControllerIdentifier.locationViewController) as! LocationViewController
        let locationManager = CLLocationManager()
        let presenter = LocationPresenter(coreLocation: locationManager, output: vc)
        vc.presenter = presenter
        controller?.pushViewController(vc, animated: true)
    }
    
    
}
