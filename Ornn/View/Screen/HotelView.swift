//
//  HotelView.swift
//  Ornn
//
//  Created by Naluebet Manpati on 24/1/2566 BE.
//

import SwiftUI

struct Message: Identifiable, Codable {
    let id: Int
    var user: String
    var text: String
}

enum SearchScope: String, CaseIterable {
    case inbox, favorites
}

struct HotelView: View {
    @State private var messages = [Message]()

    @State private var searchText = ""
    @State private var searchScope = SearchScope.inbox
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                List {
                    ForEach(filteredMessages) { message in
                        VStack(alignment: .leading) {
                            Text(message.user)
                                .font(.headline)

                            Text(message.text)
                        }
                    }
                }
            }
            .navigationTitle("Hotel")
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .onAppear(perform: runSearch)
            .onSubmit(of: .search, runSearch)
        }
    }

    var filteredMessages: [Message] {
        if searchText.isEmpty {
            return messages
        } else {
            return messages.filter { $0.text.localizedCaseInsensitiveContains(searchText) }
        }
    }

    func runSearch() {
        Task {
            guard let url = URL(string: "https://hws.dev/\(searchScope.rawValue).json") else { return }

            let (data, _) = try await URLSession.shared.data(from: url)
            messages = try JSONDecoder().decode([Message].self, from: data)
        }
    }
}

struct HotelView_Previews: PreviewProvider {
    static var previews: some View {
        HotelView()
    }
}
