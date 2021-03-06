//
//  ViewController.swift
//  Toshokan
//
//  Created by jote on 2017/02/28.
//  Copyright © 2017年 jote. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signOutButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        signInButton.addTarget(self, action: #selector(ViewController.didTapSignInButton), for: UIControlEvents.touchUpInside)
        signOutButton.addTarget(self, action: #selector(ViewController.didTapSignOutButton), for: UIControlEvents.touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didTapSignInButton() {
        GIDSignIn.sharedInstance().signIn()
    }
    
    func didTapSignOutButton() {
        GIDSignIn.sharedInstance().signOut()
    }

}

extension ViewController: GIDSignInUIDelegate {
    // Implement these methods only if the GIDSignInUIDelegate is not a subclass of
    // UIViewController.
    
    // Stop the UIActivityIndicatorView animation that was started when the user
    // pressed the Sign In button
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
//        myActivityIndicator.stopAnimating()
    }
    
    // Present a view that prompts the user to sign in with Google
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
