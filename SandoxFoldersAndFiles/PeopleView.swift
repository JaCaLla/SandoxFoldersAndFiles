//
//  PeopleView.swift
//  FilesAndFolders
//
//  Created by JAVIER CALATRAVA LLAVERIA on 18/4/25.
//

import Foundation
import SwiftUI

struct PeopleView: View {
    @StateObject var viewModel = PeopleViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.people) { person in
                    VStack(alignment: .leading) {
                        Text(person.name).font(.headline)
                        Text("Age: \(person.age)")
                    }
                }
                .onDelete { indexSet in
                    indexSet
                        .map { viewModel.people[$0].id }
                        .forEach(viewModel.deletePerson)
                }
            }
            .navigationTitle("People")
            .toolbar {
                Button("Add") {
                    viewModel.addPerson(name: "New Person", age: Int.random(in: 18...60))
                }
            }
        }.onAppear {
            if let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                print("📂 Document Directory: \(documentsPath.path)")
            }
        }
    }
}
