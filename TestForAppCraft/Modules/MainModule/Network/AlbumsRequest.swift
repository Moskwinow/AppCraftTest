//
//  AlbumRequest.swift
//  TestForAppCraft
//
//  Created by Максим Вечирко on 15.01.2021.
//

import Alamofire

class AlbumsRequest: AbstractRequestFactory {
    var errorParser: AbstractErrorParser
    var sessionManager: Session
    var queue: DispatchQueue
    var baseUrl = URL(string: "https://jsonplaceholder.typicode.com/")
    init(errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
    
}

extension AlbumsRequest: AlbumsRequestFactory {
    
    func getAlbums(completionHandler: @escaping (AFDataResponse<[Albums]>) -> ()) {
        let requestModel = GetAlbum(baseUrl: baseUrl!)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
}

extension AlbumsRequest {
    struct GetAlbum: RequestRouter {
        var baseUrl: URL
        
        var method: HTTPMethod = .get
        
        var path: String = "albums"
        
        var parameters: Parameters?
        
    }
}

