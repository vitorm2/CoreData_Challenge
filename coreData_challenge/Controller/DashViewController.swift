//
//  DashViewController.swift
//  coreData_challenge
//
//  Created by Raul Rodrigues on 6/6/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit
import CoreData

class DashViewController: UIViewController {
    @IBOutlet weak var CounterCollectionView: UICollectionView!
    
    var counters: [Counter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //createCounter()
        retrieveData()
       
        CounterCollectionView.delegate = self
        CounterCollectionView.dataSource = self
        //var counter = Counter()
        
        //deleteData()
        // Do any additional setup after loading the view.
        

    }
    
    
    
    @IBAction func reloadAction(_ sender: UIBarButtonItem) {
        CounterCollectionView.reloadData()
        self.viewDidLayoutSubviews()
        retrieveData()
    }
    
    
    func createCounter() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Counter", in: managedContext)!
        
        for i in 1...5 {
            let counter = NSManagedObject(entity: entity, insertInto: managedContext)
            counter.setValue("Número de vez que fui ao banheiro \(i)", forKey: "title")
            counter.setValue(0, forKey: "count")
            counter.setValue("red", forKey: "color")
            counter.setValue("config test", forKey: "config")
        }
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    func retrieveData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Counter")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
             counters = []
            for data in result as! [NSManagedObject] {
                //print(data.value(forKey: "title"))
                let aux = data as! Counter
                counters.append(aux)
            }
            
        } catch {
            fatalError()
        }
    }
    
    
    func deleteData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Counter")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            for data in result as! [NSManagedObject] {
                managedContext.delete(data)
            }
            
            print("after deletion")
            retrieveData()
            print("done")
            
            try managedContext.save()
        } catch {
            fatalError()
        }
        CounterCollectionView.reloadData()
    }

}

extension DashViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return counters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "counter", for: indexPath) as! CounterCollectionViewCell
        cell.titleLabel.text = counters[indexPath.row].title
        cell.counterLabel.text = String(counters[indexPath.row].count)
        cell.counter = counters[indexPath.row]
        
        cell.layer.cornerRadius = 10.0
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowRadius = 10
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        cell.layer.shadowOpacity = 0.25
        
        return cell
    }
    
    
}

extension DashViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.45, height: collectionView.frame.height * 0.3)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }
    
}
