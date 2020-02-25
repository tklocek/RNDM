//
//  Comment.swift
//  RNDM
//
//  Created by Tomek Klocek on 2020-02-09.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import Foundation
import Firebase


class Comment {
    private(set) var username: String!
    private(set) var timestamp: Date!
    private(set) var commentTxt: String!
    private(set) var documentId: String!
    private(set) var userId: String!

    
    init(username: String, timestamp: Date, commentTxt: String, documentId: String, userId: String) {
        self.username = username
        self.timestamp = timestamp
        self.commentTxt = commentTxt
        self.documentId = documentId
        self.userId = userId
    }
    
    
    class func parseData(snapshot: QuerySnapshot?) -> [Comment] {
        var comments = [Comment]()
        
        guard let snap = snapshot else { return comments}
            for document in snap.documents {
                let data = document.data()
                let username = data[USERNAME] as? String ?? "Anonymous"
                let timestamp = data[TIMESTAMP] as? Timestamp ?? Timestamp()
                let decodedTime = timestamp.dateValue()
                let documentId = document.documentID
                let userId = data[USER_ID] as? String ?? ""
        
                let commentTxt = data[COMMENT_TXT] as? String ?? ""
                
                let newComment = Comment(username: username, timestamp: decodedTime, commentTxt: commentTxt, documentId: documentId, userId: userId)
                comments.append(newComment)
            }
        
        
        return comments
    }
    
    
}
