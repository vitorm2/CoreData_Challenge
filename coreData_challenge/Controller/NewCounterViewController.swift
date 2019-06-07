//
//  NewCounterViewController.swift
//  coreData_challenge
//
//  Created by Raul Rodrigues on 6/6/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit
import CoreData

class NewCounterViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var stepTextField: UITextField!
    @IBOutlet weak var stepControl: UIStepper!
    @IBOutlet weak var colorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.addTarget(self, action: #selector(titleTextFieldDidChange(_:)), for: .editingChanged)
        
        stepTextField.keyboardType = .numberPad
        
        stepControl.value = 1
        stepControl.isContinuous = false
        stepControl.stepValue = 1
    }
    
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
        
    }
    

    
    @IBAction func doneAction(_ sender: UIBarButtonItem) {
        createCounter()
        self.dismiss(animated: true, completion: nil)
    }
    
    func createCounter() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Counter", in: managedContext)!
        
        let newCounter = NSManagedObject(entity: entity, insertInto: managedContext)
        newCounter.setValue(titleTextField.text, forKey: "title")
        newCounter.setValue(0, forKey: "count")
        newCounter.setValue("color test", forKey: "color")
        newCounter.setValue("config test", forKey: "config")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    @objc func titleTextFieldDidChange(_ textField: UITextField) {
        if textField.text == "" {
            doneButton.isEnabled = false
        } else {
            doneButton.isEnabled = true
        }
    }
    
    @objc func stepTextFieldDidChange(_ textField: UITextField) {
        if textField.text == "" {
            stepControl.value = 1
        } else {
            stepControl.value = Double(Int(textField.text!)!)
        }
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
