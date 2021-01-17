//
//  AlbumRequestFactory.swift
//  TestForAppCraft
//
//  Created by Максим Вечирко on 16.01.2021.
//

import Alamofire

protocol AlbumRequestFactory {
    func getAlbum(by albumId: Int, completionHandler: @escaping(AFDataResponse<[Album]>) -> ())
}


