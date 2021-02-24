//
//  home.swift
//  EasyPagination
//
//  Created by Администратор on 23.02.2021.
//

import SwiftUI

struct Home: View {
    @StateObject var searchData = SearchUsers()
    var body: some View {
        VStack {
            CustomSearchBar(searchData: searchData)
                .autocapitalization(.none)
            Spacer()
        }
        .onChange(of: searchData.query) { newData in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                if newData == searchData.query {
                    if searchData.query != "" {
                        searchData.page = 1
                        searchData.find()
                    } else {
                        searchData.searchUser.removeAll()
                    }
                }
            }
        }
    }
    
}

struct home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
