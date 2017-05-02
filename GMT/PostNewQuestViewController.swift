//
//  PostNewQuestViewController.swift
//  GMT
//
//  Created by siyuan on 5/2/17.
//  Copyright © 2017 siyuan. All rights reserved.
//

import UIKit
import Firebase
class PostNewQuestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    let curUser = CurrentUser()
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var NewRequestText: UITextField!
    
    @IBOutlet weak var Price: UITextField!

    @IBOutlet weak var Contact: UITextField!
    @IBAction func HandleNewPost(_ sender: UIButton) {
        
        curUser.addNewPost(Message: NewRequestText.text!, Price: Price.text!, Contact: Contact.text!, Active: "T")
        curUser.upDateAllPostArray()
        for i in (curUser.AllPosts){
            print(i)
        }
        
    
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
