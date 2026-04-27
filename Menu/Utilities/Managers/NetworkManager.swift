
import Foundation
import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://www.themealdb.com/api/json/v1/1/"
    
    private let menuURL = baseURL + "search.php?s=chicken"
    
    private init() {}
    
//    // Old funcion
//    func getMenuItems(completed: @escaping (Result<[MenuItem], APError>) -> Void) {
//
//        guard let url = URL(string: menuURL) else {
//            completed(.failure(.invalidURL))
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let _ = error {
//                completed(.failure(.unableToComplete))
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completed(.failure(.invalidResponse))
//                return
//            }
//            
//            guard let data = data else {
//                completed(.failure(.invalidData))
//                return
//            }
//            
//            do {
//                let decoder = JSONDecoder()
//                let decodedResponse = try decoder.decode(MenuItemResponse.self ,from: data)
//                
//                completed(.success(decodedResponse.request))
//            } catch {
//                completed(.failure(.invalidData))
//            }
//        }
//        
//        task.resume()
//    }
    
    
    func getMenuItems() async throws -> [MenuItem] {

        guard let url = URL(string: menuURL) else {
            throw APError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)

        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(MenuItemResponse.self ,from: data)
            // Pretty print
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted

            let prettyData = try encoder.encode(decodedResponse)
            if let prettyString = String(data: prettyData, encoding: .utf8) {
                print(prettyString)
            }

            return decodedResponse.request
        } catch {
            throw APError.invalidData
        }
    }
    
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
        
    }
}
