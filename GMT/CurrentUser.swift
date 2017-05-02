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
    }

    func addNewPost(Message: String, Price: String, Contact: String, Active: String) {
        let PostsReference = dbRef.child("Posts").childByAutoId()
        let PostsId = PostsReference.key
        let PostedPostsReference = dbRef.child("PostedPosts").child(id)
        PostedPostsReference.childByAutoId().setValue(PostsId)
        let values = ["Price":Price, "Contact": Contact, "Message": Message, "IsActive": Active]
        PostsReference.setValue(values)
        PostsReference.updateChildValues(["IsActive":"F"])
        
    }
    
    func deletePost(Pid: String){
        let PostsReference = dbRef.child("Posts").child(Pid)
        PostsReference.setValue(["IsActive":"F"])
        
    
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
                    for (k,v) in values{
                        let v = v as! [String:String]
                        let newPost = [k, v["Price"], v["Contact"], v["Message"], v["IsActive"]]
                        self.AllPosts.append(newPost as! [String])
                    }
                    
                }
            }
        )
        
    }
    func upDateSelfPostArray(){
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
        
        
    }
    


}
