//
//  DetailPresenter.swift
//  TestForAppCraft
//
//  Created by Максим Вечирко on 16.01.2021.
//

import Foundation

protocol DetailPresenterOutput: class {
    func success()
    func error()
}

class DetailPresenter {
    weak var output: DetailPresenterOutput?
    var model: [Album]?
    var albumsModel: Albums!
    var requestFactory: RequestFactory?
  
    init(requestFactory: RequestFactory, output: DetailPresenterOutput, albumsModel: Albums) {
        self.albumsModel = albumsModel
        self.requestFactory = requestFactory
        self.output = output
        self.getAlbum(by: albumsModel.id)
    }
    
    func getAlbum(by id: Int) {
        guard let factory = requestFactory else {return}
        let request = factory.makeAlbumRequestFactory()
        request.getAlbum(by: id) { [unowned self] (result) in
            switch result.result {
            case .success(let model):
                self.model = model
                self.output?.success()
            case .failure(let error):
                print(error.localizedDescription)
//                self.output?.error()
            }
        }
    }
    
}
