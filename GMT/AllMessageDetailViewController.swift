//
//  AllMessageDetailViewController.swift
//  GMT
//
//  Created by siyuan on 5/2/17.
//  Copyright © 2017 siyuan. All rights reserved.
//

import UIKit

class AllMessageDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ShowMessage.text = message
        // Do any additional setup after loading the view.
    }
    var message = ""
    @IBOutlet weak var ShowMessage: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func GoBack(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
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
