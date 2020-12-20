//
//  Database.swift
//  CryptoPortfolio
//
//  Created by Jonas Pedersen on 20/12/2020.
//

import Foundation
import SQLite3

 class Database {
    public static let shared: Database = Database()
    var db: OpaquePointer?
    let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("Database.sqlite")
    func initDB(){
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK{
            print("Error opening database")
            return
        }
        
        let createTableQuery =  "CREATE TABLE IF NOT EXISTS Currencies(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)"
        
        if sqlite3_exec(db, createTableQuery, nil, nil, nil) != SQLITE_OK {
            print("Error creating table")
            return
        }
        
        print("Everything is fine")
    }
    
    
    
    init() {
        
    }
}
