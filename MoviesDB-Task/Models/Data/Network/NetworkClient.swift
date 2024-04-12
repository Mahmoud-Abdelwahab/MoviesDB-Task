//
//  NetworkClient.swift
//  MoviesDB-Task
//
//  Created by Mahmoud Abdelwahab on 12/04/2024.
//

import Foundation

protocol NetworkClientType {
    func fetchData<T: Decodable>(from url: URL) async throws -> T
}

class NetworkClient: NetworkClientType {
    
    func fetchData<T: Decodable>(from url: URL) async throws -> T {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try DecodableData<T>.decode(data: data)
        } catch let error {
            throw NetworkError(localizedDescription: error.localizedDescription)
        }
    }
}
