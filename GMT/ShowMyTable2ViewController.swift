//
//  ShowMyTable2ViewController.swift
//  GMT
//
//  Created by siyuan on 5/2/17.
//  Copyright © 2017 siyuan. All rights reserved.
//

import UIKit

class ShowMyTable2ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var PostTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        PostTableView.delegate = self
        PostTableView.dataSource = self
        
        // Do any additional setup after loading the view.
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
        print("checkp1")
        print(allPostsArray.count)
        if (allPostsArray.count > 2){
            print(allPostsArray)
        }
        //PosttableView.reloadData()
        //self.tableView.reloadData()
        PostTableView.reloadData()
        //self.tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        // YOUR CODE HERE
        self.updateValue()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return allPostsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
//        if (cell != nil){
//            print("get your cell")
//            print(cell.reuseIdentifier)
//            
//        }
        let thecell = cell as! All2TableViewCell
        thecell.MEssage.text = allPostsArray[indexPath.row][2]
        thecell.Price.text = allPostsArray[indexPath.row][1]
        // Configure the cell...
    
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        performSegue(withIdentifier: "Seg2", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? AllMessageDetailViewController{
            dest.message = allPostsArray[(selectedIndexPath?.row)!][3]
            
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
