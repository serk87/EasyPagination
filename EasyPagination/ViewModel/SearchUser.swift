//
//  SearchUser.swift
//  EasyPagination
//
//  Created by Администратор on 23.02.2021.
//

import Foundation

class SearchUsers: ObservableObject {
    
    @Published var searchUser : [User] = []
    
    @Published var query = ""
    
    @Published var page = 1
    
    func find() {
        let searchQuery = query.replacingOccurrences(of: " ", with: "%20")
        let url = "https://api.github.com/search/users?q=\(searchQuery)&page=\(page)&per_page=10"
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) { (data, _, error) in
            guard let jsonData = data else {return}
            
            do {
                let users = try JSONDecoder().decode(Results.self, from: jsonData)
                DispatchQueue.main.async {
                    if self.page == 1 {
                        self.searchUser.removeAll()
                    }
                    self.searchUser = Array(Set(self.searchUser).union(Set(users.items)))
                    
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}
