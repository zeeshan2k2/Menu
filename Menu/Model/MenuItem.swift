
import Foundation

struct MenuItem: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let instructions: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case instructions = "strInstructions"
        case imageURL = "strMealThumb"
    }
    
    init(id: Int,
         name: String,
         description: String,
         instructions: String,
         price: Double,
         imageURL: String,
         calories: Int,
         protein: Int,
         carbs: Int) {
        
        self.id = id
        self.name = name
        self.description = description
        self.instructions = instructions
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
        let instructions = try container.decode(String.self, forKey: .instructions)
        self.instructions = instructions
        imageURL = try container.decode(String.self, forKey: .imageURL)
        
        description = "\(name) is a delicious dish made with rich flavors and fresh ingredients."
        
        // Hardcoded values (API doesn't provide these)
        price = Double.random(in: 8...15)
        calories = Int.random(in: 500...800)
        protein = Int.random(in: 10...30)
        carbs = Int.random(in: 50...90)
    }
}

struct MenuItemResponse: Codable {
    let request: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case request = "meals"
    }
}


struct MockData {
    
    static let sampleMenuItem = MenuItem(id: 0001,
                                           name: "Test Menu Item",
                                           description: "This is the description for my menu Item. It's yummy.",
                                           instructions: "Step 1: Cook it.\nStep 2: Serve it.",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let menuItems = [
        sampleMenuItem,
        sampleMenuItem,
        sampleMenuItem,
        sampleMenuItem
    ]
    
//    static let orderItemOne     = MenuItem(id: 0001,
//                                           name: "Test Menu Item One",
//                                           description: "This is the description for my menu Item. It's yummy.",
//                                           instructions: "Step 1: Cook it.\nStep 2: Serve it.",
//                                           price: 9.99,
//                                           imageURL: "",
//                                           calories: 99,
//                                           protein: 99,
//                                           carbs: 99)
//    
//    static let orderItemTwo     = MenuItem(id: 0002,
//                                           name: "Test Menu Item Two",
//                                           description: "This is the description for my menu Item. It's yummy.",
//                                           instructions: "Step 1: Cook it.\nStep 2: Serve it.",
//                                           price: 9.99,
//                                           imageURL: "",
//                                           calories: 99,
//                                           protein: 99,
//                                           carbs: 99)
//    
//    static let orderItemThree   = MenuItem(id: 0003,
//                                           name: "Test Menu Item Three",
//                                           description: "This is the description for my menu Item. It's yummy.",
//                                           instructions: "Step 1: Cook it.\nStep 2: Serve it.",
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
