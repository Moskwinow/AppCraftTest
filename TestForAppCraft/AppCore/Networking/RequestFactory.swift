//
//  RequestFactory.swift
//  Shop
//
//  Created by Максим Вечирко on 20.12.2020.
//  Copyright © 2020 Максим Вечирко. All rights reserved.
//

import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let config = URLSessionConfiguration.default
        config.httpShouldSetCookies = false
        config.headers = .default
        let manager = Session(configuration: config)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAlbumsRequestFactory() -> AlbumsRequestFactory {
        let errorParser = makeErrorParser()
        return AlbumsRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeAlbumRequestFactory() -> AlbumRequestFactory {
        let errorParser = makeErrorParser()
        return AlbumRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    
}
