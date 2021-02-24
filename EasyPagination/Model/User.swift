//
//  User.swift
//  EasyPagination
//
//  Created by Администратор on 23.02.2021.
//

import Foundation

struct User: Decodable, Hashable {
    var node_id: String
    var login: String
    var avatar_url: String
}

struct Results: Decodable {
    var items: [User]
}
