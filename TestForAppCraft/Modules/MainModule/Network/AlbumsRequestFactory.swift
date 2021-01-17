//
//  MainRequestFactory.swift
//  TestForAppCraft
//
//  Created by Максим Вечирко on 15.01.2021.
//

import Alamofire

protocol AlbumsRequestFactory {
    func getAlbums(completionHandler: @escaping(AFDataResponse<[Albums]>) -> ())
    
}
