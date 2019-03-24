//
//  Cupcake.swift
//  App
//
//  Created by Bharath  Raj kumar on 23/03/19.
//

import Foundation
import Vapor
import FluentSQLite


struct Cupcake: Content, SQLiteModel, Migration {
    var id: Int?
    var name: String?
    var description: String?
    var price: Int
}
