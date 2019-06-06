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
       
        CounterCollectionView.dataSource = self
        //var counter = Counter()
        
        //deleteData()
        // Do any additional setup after loading the view.
        

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    func config() {
    }
    
    func createCounter() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Counter", in: managedContext)!
        
        for i in 1...5 {
            let counter = NSManagedObject(entity: entity, insertInto: managedContext)
            counter.setValue("Counter \(i)", forKey: "title")
            counter.setValue(0, forKey: "count")
            counter.setValue("color test", forKey: "color")
            counter.setValue("config test", forKey: "color")
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
            
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "title"))
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DashViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return counters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "counter", for: indexPath) as! CounterCollectionViewCell
        cell.titleLabel.text = counters[indexPath.row].title
        return cell
    }
    
    
}
