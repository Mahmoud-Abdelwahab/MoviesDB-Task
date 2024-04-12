//
//  NetworkClient.swift
//  MoviesDB-Task
//
//  Created by Mahmoud Abdelwahab on 12/04/2024.
//

import Foundation

protocol NetworkClientType {
    func request<T: Decodable>(_ endpoint: MovieEndpoint) async throws -> T
}

class NetworkClient: NetworkClientType {
    
    func request<T: Decodable>(_ endpoint: MovieEndpoint) async throws -> T {
            guard let url = endpoint.makeURL() else {
                throw NetworkError.init(localizedDescription: "Invalid Data")
            }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            do {
                return try DecodableData.decode(data: data)
            } catch {
                throw NetworkError(localizedDescription: error.localizedDescription)
            }
        }
}
