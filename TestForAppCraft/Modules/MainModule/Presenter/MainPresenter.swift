//
//  MainPresenter.swift
//  TestForAppCraft
//
//  Created by Максим Вечирко on 15.01.2021.
//

import Foundation

protocol MainPresenterOutput: class {
    func success()
    func error()
}


class MainPresenter {
    weak var output: MainPresenterOutput?
    var requestFactory: RequestFactory?
    var model: [Albums]?
    
    init(requestFactory: RequestFactory, delegate output: MainPresenterOutput) {
        self.requestFactory = requestFactory
        self.output = output
        getModel()
    }
    
    private func getModel() {
        guard let factory = requestFactory else { return }
        let request = factory.makeAlbumsRequestFactory()
        request.getAlbums { (values) in
            switch values.result {
            case .success(let newModel):
                self.model = newModel
                self.output?.success()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
