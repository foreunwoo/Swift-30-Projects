//
//  Twit.swift
//  EunwooBird
//
//  Created by eunwoo on 2021/04/10.
//

import Foundation

struct Twit {
    let nickname: String
    let id: String
    let date: String
    let profileImage: String
    
    let content: String
    let contentImage: String
    
    let messageCount: String
    let retweetCount: String
    let likeCount: String
    let likeStatus: LikeStatus?
    
    init(nickname: String, id: String, date: String, profileImage: String, content: String, contentImage: String, messageCount: String, retweetCount: String, likeCount: String, likeStatus: LikeStatus) {
        self.nickname = nickname
        self.id = id
        self.date = date
        self.profileImage = profileImage
        self.content = content
        self.contentImage = contentImage
        self.messageCount = messageCount
        self.retweetCount = retweetCount
        self.likeCount = likeCount
        self.likeStatus = likeStatus
    }
}

enum LikeStatus {
    case isLiked
    case isNotLiked
}
