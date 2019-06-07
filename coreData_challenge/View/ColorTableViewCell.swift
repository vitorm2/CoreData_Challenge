//
//  ColorTableViewCell.swift
//  coreData_challenge
//
//  Created by Raul Rodrigues on 6/7/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

class ColorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        colorView.layer.cornerRadius = 15
        colorView.layer.borderWidth = 0.5
        colorView.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    
    func config(colorName: String, color: UIColor) {
        colorNameLabel.text = colorName
        colorView.backgroundColor = color
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
