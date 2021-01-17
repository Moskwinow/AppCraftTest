//
//  CoreAlbums+CoreDataProperties.swift
//  TestForAppCraft
//
//  Created by Максим Вечирко on 17.01.2021.
//
//

import Foundation
import CoreData


extension CoreAlbums {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreAlbums> {
        return NSFetchRequest<CoreAlbums>(entityName: "CoreAlbums")
    }

    @NSManaged public var userId: Int16
    @NSManaged public var id: Int16
    @NSManaged public var title: String

}

extension CoreAlbums : Identifiable {

}
