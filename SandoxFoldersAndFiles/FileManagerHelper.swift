//
//  FileManagerHelper.swift
//  FilesAndFolders
//
//  Created by JAVIER CALATRAVA LLAVERIA on 18/4/25.
//

import Foundation

class FileManagerHelper {
    static let shared = FileManagerHelper()
    
    private let fileName = "people.json"
    
    private var fileURL: URL {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documents.appendingPathComponent(fileName)
    }

    func save(_ people: [Person]) {
        do {
            let data = try JSONEncoder().encode(people)
            try data.write(to: fileURL)
        } catch {
            print("Error saving file: \(error)")
        }
    }
    
    func load() -> [Person] {
        do {
            let data = try Data(contentsOf: fileURL)
            let people = try JSONDecoder().decode([Person].self, from: data)
            return people
        } catch {
            print("Error reading file: \(error)")
            return []
        }
    }
    
    func deleteFile() {
        do {
            try FileManager.default.removeItem(at: fileURL)
        } catch {
            print("Error deleting file: \(error)")
        }
    }
}
