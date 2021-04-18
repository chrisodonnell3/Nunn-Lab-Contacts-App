//
//  Contact+CoreDataProperties.swift
//  NunnLabContacts
//
//  Created by Orgil Batzaya on 4/12/21.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var name: String
    @NSManaged public var birthdate: String?
    @NSManaged public var sex: String?
    @NSManaged public var aliases: [String]?
    @NSManaged public var location: String?
    @NSManaged public var picture: Data?

}

extension Contact : Identifiable {

}
