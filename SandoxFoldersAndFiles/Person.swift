//
//  Person.swift
//  FilesAndFolders
//
//  Created by JAVIER CALATRAVA LLAVERIA on 18/4/25.
//

import Foundation

struct Person: Codable, Identifiable {
    var id: UUID
    var name: String
    var age: Int
}
