//
//  ListCell.swift
//  Practical
//
//  Created by Arpan Shah on 19/07/21.
//

import UIKit
import SDWebImage

class ListCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
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
        let dataCount: Int = arrImageData.count
        if dataCount % 2 == 0 {
            return CGSize(width: collectionView.frame.width / 2 - 10, height: collectionView.frame.width / 2 - 10)
          } else {
            if indexPath.row == 0{
                return CGSize(width: collectionView.frame.width, height: 150)
            }else{
                return CGSize(width: collectionView.frame.width / 2 - 10, height: collectionView.frame.width / 2 - 10)
            }
          }
        
        
    }
    
}
