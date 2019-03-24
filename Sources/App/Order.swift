//
//  Order.swift
//  App
//
//  Created by Bharath  Raj kumar on 24/03/19.
//

import Foundation
import FluentSQLite
import Vapor

struct Order: Migration, SQLiteModel, Content
{
    var id: Int?
    var cakeName: String
    var buyerName: String
    var date: Date?
}
