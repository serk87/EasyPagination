//
//  CustomSearchBar.swift
//  EasyPagination
//
//  Created by Администратор on 23.02.2021.
//

import SwiftUI

struct CustomSearchBar: View {
    @ObservedObject var searchData: SearchUsers
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundColor(.gray)
                TextField("Search...", text: $searchData.query)
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            
            if !searchData.searchUser.isEmpty {
                ScrollView(.vertical, showsIndicators: true) {
                    LazyVStack(alignment: .leading, spacing: 12) {
                        ForEach(searchData.searchUser, id: \.self) { user in
                            VStack(alignment: .leading, spacing: 6, content: {
                                Text(user.login)
                                Divider()
                            })
                            .padding(.horizontal)
                            .onAppear(perform: {
                                if user.node_id == self.searchData.searchUser.last?.node_id && self.searchData.page <= 3 {
                                    searchData.page += 1
                                    searchData.find()
                                }
                            })
                        }
                    }
                    .padding(.top)
                }
                .frame(height: 240)
                
            }
        }
        .background(Color(.white).opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding()
    }
}
