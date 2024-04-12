//
//  UseCaseType.swift
//  MoviesDB-Task
//
//  Created by Mahmoud Abdelwahab on 13/04/2024.
//

import Foundation

protocol UseCaseType {
    associatedtype Item
    func excute() async throws -> Item
}
