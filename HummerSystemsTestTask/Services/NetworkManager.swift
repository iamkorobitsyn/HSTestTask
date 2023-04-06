//
//  NetworkManager.swift
//  HummerSystemsTestTask
//
//  Created by Александр Коробицын on 04.04.2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchJSON(url: String, completion: @escaping(Result<[ViewModel], NetworkError>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) {data, respounse, error in
            guard let data = data, let respounse = respounse else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "not description")
                return
            }
            
            
            
            guard url == respounse.url else { return }
            
            do {
                let JSONData = try JSONDecoder().decode([ViewModel].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(JSONData))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
