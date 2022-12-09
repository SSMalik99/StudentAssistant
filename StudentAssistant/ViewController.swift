//
//  ViewController.swift
//  StudentAssistant
//
//  Created by Saravjeet Singh on 2022-11-29.
//

import UIKit

class ViewController: UIViewController {
    
    //class variables
    var authenticationModel = AuthenticationModel()
//Outlets
    @IBOutlet weak var fullNameLabel: UITextField!
    
    @IBOutlet weak var emailLable: UITextField!
    
    @IBOutlet weak var phoneNumber: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // check 
        if authenticationModel.isUserAvailable(){
            performSegue(withIdentifier: "loginToProfile", sender: self)
        }
        
    }
    
    // validate user credentials
    func userCredValid()-> Bool{
        if fullNameLabel.text == "" {
            showAlertMessage(title: "Error", message: "Full Name is requried")
            return false
        }
        
        if emailLable.text == "" {
            showAlertMessage(title: "Error", message: "Email Is required")
            return false
        }
        
        if phoneNumber.text == "" {
            showAlertMessage(title: "Error", message: "Phone Number Is required")
            return false
        }
        
        
        return true
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if !userCredValid(){
            return false
        }
        
        // save user authentication
        authenticationModel.saveUserDate(name: fullNameLabel.text!, email: emailLable.text!, phone: phoneNumber.text!)
        
        return true
    }
    
    
    
    func showAlertMessage(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        print(alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
            @unknown default:
                print("unknown value")
            }}))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

