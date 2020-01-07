//
//  ViewController.swift
//  firebaseud
//
//  Created by Bhushan on 1/7/20.
//  Copyright © 2020 Bhushan Badhe. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var fees: UITextField!
    
    
    @IBOutlet weak var duration: UITextField!
    var ref: DatabaseReference!
    var courseDic = NSMutableDictionary()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    @IBAction func savebtn(_ sender: UIButton) {
       ref = Database.database().reference()
        courseDic.setValue(name.text!, forKey: "Name")
        courseDic.setValue(fees.text!, forKey: "Fees")
        courseDic.setValue(duration.text!, forKey: "Duration")
        ref.child("Course").childByAutoId().setValue(courseDic)
        {
            (error, reference) in
            if ((error) != nil)
            {
                print("Failed to insert:\(error?.localizedDescription)")
            }
            else
            {
                let alert = UIAlertController(title: "Success!!", message: "Data has been inserted Successfully!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
              //  alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "Default action"), style: .default, true, completion: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        
        
        
    }
    
}

