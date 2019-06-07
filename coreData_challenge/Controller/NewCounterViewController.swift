//
//  NewCounterViewController.swift
//  coreData_challenge
//
//  Created by Raul Rodrigues on 6/6/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

class NewCounterViewController: UIViewController {

    @IBOutlet weak var CancelButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
