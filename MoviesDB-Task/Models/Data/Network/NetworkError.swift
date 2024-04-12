//
//  NetworkError.swift
//  MoviesDB-Task
//
//  Created by Mahmoud Abdelwahab on 12/04/2024.
//

import Foundation

protocol NetworkErrorProtocol: Error {
    var localizedDescription: String { get }
}


struct NetworkError: NetworkErrorProtocol {
    let localizedDescription: String
}
