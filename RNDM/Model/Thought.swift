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
    private(set) var timestamp: Date!
    private(set) var thoughtTxt: String!
    private(set) var numLikes: Int!
    private(set) var numComments: Int!
    private(set) var documentId: String!
    
    init(username: String, timestamp: Date, thoughtTxt: String, numLikes: Int, numComments: Int, documentId: String) {
        self.username = username
        self.timestamp = timestamp
        self.thoughtTxt = thoughtTxt
        self.numLikes = numLikes
        self.numComments = numComments
        self.documentId = documentId
    }
    
    class func parseData(snapshot: QuerySnapshot?) -> [Thought] {
        var thoughts = [Thought]()
        
        guard let snap = snapshot else { return thoughts}
            for document in snap.documents {
                let data = document.data()
                let username = data[USERNAME] as? String ?? "Anonymous"
                let timestamp = data[TIMESTAMP] as? Timestamp ?? Timestamp()
                let decodedTime = timestamp.dateValue()
        
                let thoughtTxt = data[THOUGHT_TXT] as? String ?? ""
                let numLikes = data[NUM_LIKES] as? Int ?? 0
                let numComents = data[NUM_COMMENTS] as? Int ?? 0
                let documentId = document.documentID
                
                let newThought = Thought(username: username, timestamp: decodedTime, thoughtTxt: thoughtTxt, numLikes: numLikes, numComments: numComents, documentId: documentId)
                thoughts.append(newThought)
            }
        
        
        return thoughts
    }
    
    
}
