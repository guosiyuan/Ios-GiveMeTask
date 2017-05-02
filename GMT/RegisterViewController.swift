//
//  RegisterViewController.swift
//  GMT
//
//  Created by siyuan on 4/3/17.
//  Copyright © 2017 siyuan. All rights reserved.
//

import UIKit
import Firebase
class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var ReenterPasswordText: UITextField!
    
    @IBAction func SignUpPressed(_ sender: UIButton) {
        guard let email = EmailTextField.text else {
            return
        }
        guard let passwor = PasswordTextField.text  else {
            return
        }
        guard let usrName = UserName.text else {
            return
        }
        if (passwor != ReenterPasswordText.text!) {
            return
        }
        
        FIRAuth.auth()?.createUser(withEmail: email, password: passwor, completion: { (user, error) in
            
            if error != nil {
                print(error)
                return
            }
            //finish adding user to firebase
            
            let ref = FIRDatabase.database().reference(fromURL: "https://gmt-siyuan.firebaseio.com/")
            guard let uid = user?.uid else {
                return
            }
            
            let usersReference = ref.child("users").child(uid)
            
            let values = ["name": usrName, "email": email]
            usersReference.updateChildValues(values, withCompletionBlock: {(error, ref) in
                if error != nil {
                    print(error)
                    return
                }
            })
            self.performSegue(withIdentifier: "ToTabView", sender: nil)
            
            
        })
        
        

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
