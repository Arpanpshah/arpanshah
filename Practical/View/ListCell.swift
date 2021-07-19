//
//  ListCell.swift
//  Practical
//
//  Created by Arpan Shah on 19/07/21.
//

import UIKit
import SDWebImage

class ListCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet var dataCollection : UICollectionView!
    @IBOutlet var lblName : UILabel!
    @IBOutlet var imgUser : UIImageView!
    
    var arrImageData = NSArray()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgUser.layer.cornerRadius = imgUser.frame.height/2
        dataCollection.delegate = self
        dataCollection.dataSource = self
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func CollectionviewReaload(){
        dataCollection.reloadData()
    }
    
    // MARK:- UICollectionViewDelegate & UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionCell", for: indexPath) as! ImageCollectionCell
        
        let strImageURL = arrImageData[indexPath.row] as? String ?? ""
        cell.imgUserData.sd_setImage(with: URL(string: strImageURL), placeholderImage: UIImage(named: "placeholder.png"))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 180)
    }
    
}
