//
//  RealmManager .swift
//  Medium-SwiftRealm
//
//  Created by Batuhan Küçükyıldız on 21.08.2023.
//

import Foundation
import RealmSwift



class RealmManager{
    private(set) var localRealm : Realm?
    init(){}
    
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
                    let newUser = UserInformation(value: ["enail" : email , "password" : password])
                    print("Added new user -> \(newUser) ")
                }
            }
            catch let error {
                print("Error creating user \(error)")
            }
        }
    }
}


