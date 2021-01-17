//
//  AlbumRequest.swift
//  TestForAppCraft
//
//  Created by Максим Вечирко on 16.01.2021.
//

import Alamofire

class AlbumRequest: AbstractRequestFactory {
    
    var errorParser: AbstractErrorParser
    var sessionManager: Session
    var baseUrl = URL(string: "https://jsonplaceholder.typicode.com/")!
    var queue: DispatchQueue
    
    init(errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }

}

extension AlbumRequest: AlbumRequestFactory {
    func getAlbum(by albumId: Int, completionHandler: @escaping (AFDataResponse<[Album]>) -> ()) {
        let requestModel = GetCurrentAlbum(baseUrl: baseUrl, albumId: albumId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
}

extension AlbumRequest {
    struct GetCurrentAlbum: RequestRouter {
        var baseUrl: URL
        var albumId: Int
        var method: HTTPMethod = .get
        
        var path: String = "photos"
        
        var parameters: Parameters? {
            return [
                "albumId": albumId
            ]
        }
        
    }
    
    
}

