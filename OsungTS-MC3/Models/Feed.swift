//
//  Feed.swift
//  OsungTS-MC3
//
//  Created by Kim Insub on 2022/07/12.
//

import Foundation

struct Feed {
    let username: String
    let profileImage: String
    let image: String
    let author: String
    let title: String
    let hashTags: [HashTag]
}

struct HashTag {
    let hashTag: String
}
