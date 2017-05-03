//
//  ViewMessageTableViewController.swift
//  GMT
//
//  Created by siyuan on 5/1/17.
//  Copyright © 2017 siyuan. All rights reserved.
//

import UIKit
import Firebase
class ViewMessageTableViewController: UITableViewController {
    @IBOutlet var PostTableView: UITableView!
    
    var allPostsArray: [[String]] = []
    var allSelfPostsArray: [[String]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        PostTableView.delegate = self
        PostTableView.dataSource = self

        let ref = FIRDatabase.database().reference(fromURL: "https://gmt-siyuan.firebaseio.com/")
        //ref.updateChildValues(["SomeValue":123123])
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        updateValue()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.updateValue()
    }
    let curUser = CurrentUser()
    func updateValue(){
        curUser.upDateAllPostArray()
        curUser.upDateSelfPostArray()
        allPostsArray = curUser.AllPosts
        allSelfPostsArray = curUser.AllSelfPosts
        print("checkp1")
        print(allPostsArray.count)
        if (allPostsArray.count > 2){
            print(allPostsArray)
        }
        tableView.reloadData()
        //self.tableView.reloadData()
        PostTableView.reloadData()
        //self.tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return allPostsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
        if (cell != nil){
            print("get your cell")
            print(cell.reuseIdentifier)

        }
        let thecell = cell as! AllMessageTableViewCell
        thecell.MessagePoster.text = allPostsArray[indexPath.row][1]
        thecell.Price.text = allPostsArray[indexPath.row][2]
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
