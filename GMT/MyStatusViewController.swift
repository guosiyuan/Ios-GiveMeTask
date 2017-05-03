//
//  MyStatusViewController.swift
//  GMT
//
//  Created by siyuan on 5/2/17.
//  Copyright © 2017 siyuan. All rights reserved.
//

import UIKit

class MyStatusViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var PresentTableView: UITableView!
    @IBOutlet weak var UsrName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PresentTableView.delegate = self
        PresentTableView.dataSource = self
        // Do any additional setup after loading the view.
        UsrName.text = curUser.username
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    let curUser = CurrentUser()
    var allPostsArray: [[String]] = []
    var allSelfPostsArray: [[String]] = []
    var selectedIndexPath: IndexPath?
    func updateValue(){
        curUser.upDateAllPostArray()
        curUser.upDateSelfPostArray()
        allPostsArray = curUser.AllPosts
        allSelfPostsArray = curUser.AllSelfPosts
        print("checkp2")
        print(allSelfPostsArray.count)
        if (allSelfPostsArray.count > 2){
            print(allSelfPostsArray)
        }
        //PosttableView.reloadData()
        //self.tableView.reloadData()
        PresentTableView.reloadData()
        //self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // YOUR CODE HERE
        self.updateValue()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return allSelfPostsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell2", for: indexPath)
        //        if (cell != nil){
        //            print("get your cell")
        //            print(cell.reuseIdentifier)
        //
        //        }
        let thecell = cell as! PersonalTableViewCell
        thecell.GeneralMessage.text = allSelfPostsArray[indexPath.row][2]
        // Configure the cell...
        
        return cell
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
