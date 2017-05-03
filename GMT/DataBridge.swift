//
//  DataBridge.swift
//  GMT
//
//  Created by siyuan on 5/2/17.
//  Copyright © 2017 siyuan. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

let dbRef = FIRDatabase.database().reference()
let currentUser = FIRAuth.auth()?.currentUser
let id = currentUser?.uid


func addNewPost(Message: String, Price: String, Contact: String) {
    let PostsReference = dbRef.child("Posts").childByAutoId()
    let PostsId = PostsReference.key
    let PostedPostsReference = dbRef.child("PostedPosts").child(id!)
    PostedPostsReference.childByAutoId().setValue(PostsId)
    let values = ["Price":Price, "Contact": Contact, "Message": Message]
    PostsReference.setValue(values)
    
}

//func deletePost(Pid: String){
//    let PostsReference = dbRef.child("Posts").child(Pid)
//    PostsReference.setValue(["IsActive":"F"])
//    
//    
//}



