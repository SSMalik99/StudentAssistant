//
//  AuthenticationModel.swift
//  StudentAssistant
//
//  Created by Saravjeet Singh on 2022-12-07.
//

import Foundation

class AuthenticationModel{
    var constants = Constants()
    
    func saveUserDate (name: String, email : String, phone : String) {
        UserDefaults.standard.set(name, forKey: constants.FULL_NAME)
        UserDefaults.standard.set(email, forKey: constants.EMAIL)
        UserDefaults.standard.set(phone, forKey: constants.PHONE)
    }
    
    func isUserAvailable() -> Bool {
        if (
            UserDefaults.standard.value(forKey: constants.FULL_NAME) != nil &&
            UserDefaults.standard.value(forKey: constants.EMAIL) != nil
            &&
            UserDefaults.standard.value(forKey: constants.PHONE) != nil
        ) {
            return true
        }
        return false
    }
    
}

struct Constants {
    let FULL_NAME = "full_name"
    let EMAIL = "email"
    let PHONE = "phone"
}
