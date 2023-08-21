//
//  UserInformation.swift
//  Medium-SwiftRealm
//
//  Created by Batuhan Küçükyıldız on 21.08.2023.
//

import Foundation
import RealmSwift


class UserInformation : Object , ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id : ObjectId
    @Persisted var email : String = ""
    @Persisted var password : String = ""
}
