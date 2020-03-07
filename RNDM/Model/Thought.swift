//
//  Thought.swift
//  RNDM
//
//  Created by Tomek Klocek on 2020-02-03.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import Foundation
import Firebase


class Thought {
    private(set) var username: String!
    private(set) var category: String!
    private(set) var timestamp: Date!
    private(set) var thoughtTxt: String!
    private(set) var numLikes: Int!
    private(set) var numComments: Int!
    private(set) var documentId: String!
    private(set) var userId: String!
    
    init(username: String, category: String, timestamp: Date, thoughtTxt: String, numLikes: Int, numComments: Int, documentId: String, userId: String) {
        self.username = username
        self.category = category
        self.timestamp = timestamp
        self.thoughtTxt = thoughtTxt
        self.numLikes = numLikes
        self.numComments = numComments
        self.documentId = documentId
        self.userId = userId
    }
    
    class func parseData(snapshot: QuerySnapshot?) -> [Thought] {
        var thoughts = [Thought]()
        
        guard let snap = snapshot else { return thoughts}
            for document in snap.documents {
                let data = document.data()
                let category = data[CATEGORY] as? String ?? "funny"
                let username = data[USERNAME] as? String ?? "Anonymous"
                let timestamp = data[TIMESTAMP] as? Timestamp ?? Timestamp()
                let decodedTime = timestamp.dateValue()
        
                let thoughtTxt = data[THOUGHT_TXT] as? String ?? ""
                let numLikes = data[NUM_LIKES] as? Int ?? 0
                let numComents = data[NUM_COMMENTS] as? Int ?? 0
                let documentId = document.documentID
                let userId = data[USER_ID] as? String ?? ""
                
                let newThought = Thought(username: username, category: category, timestamp: decodedTime, thoughtTxt: thoughtTxt, numLikes: numLikes, numComments: numComents, documentId: documentId, userId: userId)
                thoughts.append(newThought)
            }
        
        
        return thoughts
    }
    
    
}
