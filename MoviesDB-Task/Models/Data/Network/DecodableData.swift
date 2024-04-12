//
//  DecodableData.swift
//  MoviesDB-Task
//
//  Created by Mahmoud Abdelwahab on 12/04/2024.
//

import Foundation

protocol DecodableDataProtocol {
    associatedtype T: Decodable
    
    static func decode(data: Data) throws -> T
}


struct DecodableData<T: Decodable>: DecodableDataProtocol {
    static func decode(data: Data) throws -> T {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError(localizedDescription: error.localizedDescription)
        }
    }
}
