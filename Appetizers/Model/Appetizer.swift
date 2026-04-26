//
//  Appetizer.swift
//  Appetizers
//
//  Created by Zeeshan Waheed on 23/04/2026.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case description = "strInstructions"
        case imageURL = "strMealThumb"
    }
    
    init(id: Int,
         name: String,
         description: String,
         price: Double,
         imageURL: String,
         calories: Int,
         protein: Int,
         carbs: Int) {
        
        self.id = id
        self.name = name
        self.description = description
        self.price = price
        self.imageURL = imageURL
        self.calories = calories
        self.protein = protein
        self.carbs = carbs
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // API gives String → convert to Int
        let idString = try container.decode(String.self, forKey: .id)
        id = Int(idString) ?? 0
        
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        imageURL = try container.decode(String.self, forKey: .imageURL)
        
        // Hardcoded values (API doesn't provide these)
        price = 9.99
        calories = 500
        protein = 30
        carbs = 50
    }
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
    
    enum CodingKeys: String, CodingKey {
        case request = "meals"
    }
}


struct MockData {
    
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Test Appetizer",
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let appetizers = [
        sampleAppetizer,
        sampleAppetizer,
        sampleAppetizer,
        sampleAppetizer
    ]
    
//    static let orderItemOne     = Appetizer(id: 0001,
//                                           name: "Test Appetizer One",
//                                           description: "This is the description for my appetizer. It's yummy.",
//                                           price: 9.99,
//                                           imageURL: "",
//                                           calories: 99,
//                                           protein: 99,
//                                           carbs: 99)
//    
//    static let orderItemTwo     = Appetizer(id: 0002,
//                                           name: "Test Appetizer Two",
//                                           description: "This is the description for my appetizer. It's yummy.",
//                                           price: 9.99,
//                                           imageURL: "",
//                                           calories: 99,
//                                           protein: 99,
//                                           carbs: 99)
//    
//    static let orderItemThree   = Appetizer(id: 0003,
//                                           name: "Test Appetizer Three",
//                                           description: "This is the description for my appetizer. It's yummy.",
//                                           price: 9.99,
//                                           imageURL: "",
//                                           calories: 99,
//                                           protein: 99,
//                                           carbs: 99)
//    
//    static let orderItems = [
//        orderItemOne,
//        orderItemTwo,
//        orderItemThree
//    ]
}
