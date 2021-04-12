//
//  PersistenceManager.swift
//  NunnLabContacts
//
//  Created by Orgil Batzaya on 4/12/21.
//

import Foundation
import CoreData

final class PersistenceManager {
    
    // API layer for inserting, updating, and retrieving contact/profile entities and
    // persisting changes to a device's permanent local storage
    // HOW TO USE: first get an instance of this singleton class like:
    // persistenceManager = PersistenceManager.shared
    // then call public methods: persistenceManager.getContacts(), etc.
    
    private init() {}
    
    static let shared = PersistenceManager()
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "NunnLabContacts")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    // MARK: - Core Data Saving support
    func save() {
        if context.hasChanges {
            do {
                try context.save()
                print("saved successfully")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    private func fetch<T: NSManagedObject>(_ objectType: T.Type) -> [T] {
        let entityName = String(describing: objectType)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do {
            let fetchedObjects = try context.fetch(fetchRequest) as? [T]
            return fetchedObjects ?? [T]()
        } catch {
            print(error)
            return [T]()
        }
    }
    
    // MARK: - for create profile functionality
    func insertContact(name: String, aliases: [String]?, birthdate: Date?, sex: String?, location: String?, picture: Data?) {
        let contact = Contact(context: context)
        contact.name = name
        contact.aliases = aliases
        contact.birthdate = birthdate
        contact.sex = sex
        contact.location = location
        contact.picture = picture
        save()
    }
    
    // MARK: - for edit profile functionality
    // specify which contact object and only input the updated fields, leave anything else empty
    func updateContact(contact: Contact, name: String?, aliases: [String]?, birthdate: Date?, sex: String?, location: String?, picture: Data?) {
        contact.name = (name == nil) ? contact.name : name!
        contact.aliases = (aliases == nil) ? contact.aliases : aliases!
        contact.birthdate = (birthdate == nil) ? contact.birthdate : birthdate!
        contact.sex = (sex == nil) ? contact.sex : sex!
        contact.location = (location == nil) ? contact.location: location!
        contact.picture = (picture == nil) ? contact.picture : picture!
        save()
    }
    
    // MARK: - for landing page/gallery/collection view
    func getContacts() -> [Contact]{
        let contacts = fetch(Contact.self)
        printContacts(contacts: contacts)
        return contacts
    }
    
    private func printContacts(contacts: [Contact]) {
        contacts.forEach({ contact in
            print("name: " + contact.name)
            let aliases = contact.aliases ?? [String]()
            print("aliases: " + aliases.joined(separator: ", ") + "\n")
        })
    }
}
