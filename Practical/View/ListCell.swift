//
//  ListCell.swift
//  Practical
//
//  Created by Arpan Shah on 19/07/21.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet var dataCollection : UICollectionView!
    @IBOutlet var lblName : UILabel!
    @IBOutlet var imgUser : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgUser.layer.cornerRadius = imgUser.frame.height/2
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
