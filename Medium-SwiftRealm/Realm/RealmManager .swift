//
//  RealmManager .swift
//  Medium-SwiftRealm
//
//  Created by Batuhan Küçükyıldız on 21.08.2023.
//

import Foundation
import RealmSwift



class RealmManager : ObservableObject{
    private(set) var localRealm : Realm?
    @Published private(set) var user : [UserInformation] = []
    init(){
        initiliazeRealmManager()
    }
    
    func initiliazeRealmManager() {
        do{
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm()
        }
        catch let error {
            print("Realm Configuration Error \(error)")
        }
        
    }
    
    func addUser(email : String , password : String){
        if let localRealm = localRealm {
            do {
                try localRealm.write{
                    let newUser = UserInformation(value: ["email" : email , "password" : password])
                    localRealm.add(newUser)
                    print("Added new user -> \(newUser) ")
                }
            }
            catch let error {
                print("Error creating user \(error)")
            }
        }
    }
    
    func getUser(){
        if let localRealm = localRealm {
            let userInformation = localRealm.objects(UserInformation.self)
            print(userInformation)
            user = []
            user.forEach{item in
                user.append(item)
            }
            print(user)
        }
    }
    
    func updateUser(id: ObjectId, newPassword: String) {
            if let localRealm = localRealm {
                do {
                    let password = localRealm.objects(UserInformation.self).filter(NSPredicate(format: "id == %@", id))
                    guard let passwordUpdate = password.first else { return }
                    try localRealm.write {
                        passwordUpdate.password = newPassword
                        print("Updated password with id \(id)")
                    }

                } catch {
                    print("Error updating password \(id)")

                }

            }

        }

    func deleteUser(id: ObjectId) {

        if let localRealm = localRealm {
            do {
                let userDelete = localRealm.objects(UserInformation.self).filter(NSPredicate(format: "id == %@", id))
                guard !userDelete.isEmpty else { return }
                try localRealm.write {
                localRealm.delete(userDelete)
                print("Deleted user with id \(id)")
                }
            }
            catch let error{
                print("Error deleting user \(id) to Realm: \(error)")
                }
            }
        }
}


