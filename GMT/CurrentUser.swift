//
//  CurrentUser.swift
//  GMT
//
//  Created by siyuan on 5/2/17.
//  Copyright © 2017 siyuan. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class CurrentUser {
    var AllPosts: [[String]]//form: id: [[postID, User,price, message,contact], [User, price, message, contact]...]
    var SelfPosts: [String]//form: [poid, poid, poid]
    var AllSelfPosts: [[String]]
    var username: String!
    var id: String!
    var sentIDs: [String]?
    let dbRef = FIRDatabase.database().reference()
    init() {
        let currentUser = FIRAuth.auth()?.currentUser
        username = currentUser?.displayName
        id = currentUser?.uid
        AllPosts = []
        SelfPosts = []
        AllSelfPosts = []
    }

    func upDateAllPostArray(){
        
        let PostsReference = dbRef.child("Posts")
        PostsReference.observeSingleEvent(of: .value, with:
            {snapshot in
                if (snapshot.exists()){
                    let values1 = snapshot.value
                    if values1 == nil {
                        print("values1 is nil")
                        return
                    }
                    let values = values1 as! [String:AnyObject]//[post ID: [message: hhh, "price", hhh]]
                    self.AllPosts = []
                    for (k,v) in values{
                        let v = v as! [String:String]
                        let newPost = [k, v["Price"], v["Contact"], v["Message"]]
                        self.AllPosts.append(newPost as! [String])
                    }
                    
                }
            }
        )
        
    }
    func upDateSelfPostArray(){
        //self.SelfPosts = []
        let PostedPostsReference = dbRef.child("PostedPosts").child(id)
        PostedPostsReference.observeSingleEvent(of: .value, with:
            {snapshot in
                if (snapshot.exists()){
                    let values1 = snapshot.value
                    if values1 == nil {
                        print("values1 is nil")
                        return
                    }
                    let values = values1 as! [String:AnyObject]//[blablabla: blablabla]
                    for (k,v) in values{
                        let v = v as! String//the post id posted by this user
                        self.SelfPosts.append(v)
                    }
                }
        })
        //finish selfpost ID array
        print(self.SelfPosts)
        self.AllSelfPosts = []
        
            let postID = dbRef.child("Posts")
            
            postID.observeSingleEvent(of: .value, with: {
                snapshot in
                if (snapshot.exists()){
                    let values1 = snapshot.value
                    if values1 == nil {
                        print("values1 is nil")
                        return
                    }
                    let values = values1 as! [String:AnyObject]//[post ID: [message: hhh, "price", hhh]]
                    
                    for (k,v) in values{
                        if (self.SelfPosts.contains(k)){
                            let v = v as! [String:String]
                            let newPost = [k, v["Price"], v["Contact"], v["Message"]]
                            self.AllSelfPosts.append(newPost as! [String])
                        }
                        
                    }
                }
            })
        
        
    }

    


}
