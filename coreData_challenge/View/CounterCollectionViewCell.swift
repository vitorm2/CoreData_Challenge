//
//  CounterCollectionViewCell.swift
//  coreData_challenge
//
//  Created by Raul Rodrigues on 6/6/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit
import CoreData

class CounterCollectionViewCell: UICollectionViewCell {

    
    var counter: Counter!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    
    @IBAction func plusAction(_ sender: UIButton) {
        retrieveData()
    }
    
    func retrieveData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Counter")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            for data in result as! [NSManagedObject] {
                //print(data.value(forKey: "title"))
                let aux = data as! Counter
                if aux == counter {
                    aux.count = aux.count + 1
                    counterLabel.text = String(aux.count)
                }
            }
            
            
            try managedContext.save()
           
            
        } catch {
            fatalError()
        }
    }
    
}
