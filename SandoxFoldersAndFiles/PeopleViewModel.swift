//
//  PeopleViewModel.swift
//  FilesAndFolders
//
//  Created by JAVIER CALATRAVA LLAVERIA on 18/4/25.
//

import Foundation

class PeopleViewModel: ObservableObject {
    @Published var people: [Person] = []
    
    init() {
        people = FileManagerHelper.shared.load()
    }
    
    func addPerson(name: String, age: Int) {
        let newPerson = Person(id: UUID(), name: name, age: age)
        people.append(newPerson)
        saveChanges()
    }
    
    func updatePerson(id: UUID, newName: String, newAge: Int) {
        if let index = people.firstIndex(where: { $0.id == id }) {
            people[index].name = newName
            people[index].age = newAge
            saveChanges()
        }
    }
    
    func deletePerson(id: UUID) {
        people.removeAll { $0.id == id }
        saveChanges()
    }
    
    private func saveChanges() {
        FileManagerHelper.shared.save(people)
    }
}

