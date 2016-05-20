//
//  Product+CoreDataProperties.swift
//  Wishlist
//
//  Created by Sem Schilder on 20/05/2016.
//  Copyright © 2016 D3 - Creative Agency. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Product {

    @NSManaged var title: String?
    @NSManaged var store: String?
    @NSManaged var image: NSData?

}
