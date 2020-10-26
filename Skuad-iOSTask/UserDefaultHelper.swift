//
//  UserDefaultHelper.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit

//MARK: UserDefaults helper class

private let suggestionList = "SuggestionsList"

class UserDefaultHelper {
    
    class func set(_ value : Any?, forkey key : String) {
        if let value = value {
            UserDefaults.standard.set(value, forKey: key)
        } else {
            UserDefaults.standard.removeObject(forKey: key)
        }
        UserDefaults.standard.synchronize()
    }

    class func get(_ key : String) -> Any? {
        return UserDefaults.standard.object(forKey: key)
    }
    
    class func addSuggestion(suggestion: String) {
        var suggestions = [String]()
        if let suggestionList = UserDefaultHelper.get(suggestionList) as? [String] {
            suggestions = suggestionList
            
            if let index = suggestionList.firstIndex(of: suggestion) {
                suggestions.remove(at: index)
            }
            
            if suggestions.count == 10 {
                suggestions.removeLast()
            }
        }
        suggestions.insert(suggestion, at: 0)
        UserDefaultHelper.set(suggestions, forkey: suggestionList)
    }
    
    class func getSuggestionList() -> [String] {
        var suggestions = [String]()
        if let suggestionList = UserDefaultHelper.get(suggestionList) as? [String] {
            suggestions = suggestionList
        }
        return suggestions
    }
}
