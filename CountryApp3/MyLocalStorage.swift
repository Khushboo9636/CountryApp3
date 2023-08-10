//
//  MyLocalStorage.swift
//  CountryApp3
//
//  Created by Khushboo on 16/09/22.
//

import Foundation
class MyLocalStorage {
    private static var myKey: String = "myKey"
    public static var myValue: String {
        set {
            UserDefaults.standard.set(newValue, forKey: myKey)
        }
        get {
            return UserDefaults.standard.string(forKey: myKey) ?? ""
        }
        
    }
   
    
    
}
