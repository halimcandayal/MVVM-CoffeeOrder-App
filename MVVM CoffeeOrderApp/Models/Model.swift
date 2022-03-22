//
//  Model.swift
//  MVVM CoffeeOrderApp
//
//  Created by Halimcan Dayal on 21.03.2022.
//

import Foundation

enum CoffeeType: String, Codable, CaseIterable {
    
    case cappuccino
    case latte
    case espresso
    case cortado
    
}

enum CoffeeSize: String, Codable, CaseIterable {
    
    case small
    case medium
    case large
}

struct Order: Codable {
    
    var name: String
    var email: String
    var type: CoffeeType
    var size: CoffeeSize
    
}
