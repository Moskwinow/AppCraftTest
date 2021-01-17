//
//  Album.swift
//  TestForAppCraft
//
//  Created by Максим Вечирко on 16.01.2021.
//

import Foundation

struct Album: Decodable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
