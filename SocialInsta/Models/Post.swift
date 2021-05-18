//
//  Post.swift
//  SocialInsta
//
//  Created by Thiago Franca Sousa on 16/05/21.
//

import Foundation

struct Post: Codable {
    let userId, id: Int
    let title, body: String
}
