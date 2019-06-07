//
//  ColorDetailViewController.swift
//  coreData_challenge
//
//  Created by Raul Rodrigues on 6/7/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

class ColorDetailViewController: UITableViewController {

    var parentController: NewCounterViewController?
    
    private var colorNames: [String] = []
    
    private var colors: [UIColor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colors.append(.white)
        colorNames.append("white")
        
        colors.append(.lightGray)
        colorNames.append("light gray")
        
        colors.append(.gray)
        colorNames.append("gray")
        
        colors.append(.darkGray)
        colorNames.append("dark gray")
        
        colors.append(.black)
        colorNames.append("black")
        
        colors.append(.red)
        colorNames.append("red")
        
        colors.append(.green)
        colorNames.append("green")
        
        colors.append(.blue)
        colorNames.append("blue")
        
        colors.append(.magenta)
        colorNames.append("magenta")
        
        colors.append(.purple)
        colorNames.append("purple")
        
        colors.append(.orange)
        colorNames.append("orange")
        
        colors.append(UIColor.brown)
        colorNames.append("brown")
        
        colors.append(UIColor.cyan)
        colorNames.append("cyan")
        
        colors.append(.yellow)
        colorNames.append("yellow")
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "colorCell") as? ColorTableViewCell else {
            fatalError()
        }
        
        cell.config(colorName: colorNames[indexPath.row], color: colors[indexPath.row])
        
        return cell
    }

}
