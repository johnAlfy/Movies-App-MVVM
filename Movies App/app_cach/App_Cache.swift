//
//  App_Cach.swift
//  Movies App
//
//  Created by John Alfy on 1/12/22.
//

import Foundation
class AppCache {
    
    static let shared = AppCache()
    let defaults = UserDefaults(suiteName: "Movie_App")
    
    func getBool (key : String) -> Bool? {
        return defaults!.value(forKey: key) as? Bool
    }
    
    func setBool(key : String , bool: Bool)  {
        defaults!.set(bool, forKey: key)
    }
}
