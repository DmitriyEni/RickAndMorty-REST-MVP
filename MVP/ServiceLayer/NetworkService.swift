//
//  NetworkService.swift
//  MVP
//
//  Created by Dmitriy Eni on 24.09.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func getPerson(completion: @escaping (Result<[Person]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getPerson(completion: @escaping (Result<[Person]?, Error>) -> Void) {
        let urlString = "https://rickandmortyapi.com/api/character"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let obj = try JSONDecoder().decode([Person].self, from: data!)
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
