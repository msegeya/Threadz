//
//  TLoginViewController.swift
//  Threadz
//
//  Created by Hammad Mushtaq on 2/10/16.
//  Copyright © 2016 Hammad Mushtaq. All rights reserved.
//

import UIKit

class TLoginViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBActions

    @IBAction func didPressLoginButton(sender: AnyObject) {
        // Do the network call to login the user using the phone number and password provided
        // For now, if the user does not exist this will create the user
        TSessionManager.sharedManager.logInWithPhoneNumber(self.phoneNumberTextField.text!, password: self.passwordTextField.text!, callback: { (user) in
            if(user != nil) {
                let storyboard = self.storyboard
                let mainTabBarVC = storyboard?.instantiateViewControllerWithIdentifier(TStoryboardIdTabBarController)
                self.presentViewController(mainTabBarVC!, animated: false, completion: nil)
            }
        })
    }
    
    @IBAction func didPressSignUpButton(sender: AnyObject) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
