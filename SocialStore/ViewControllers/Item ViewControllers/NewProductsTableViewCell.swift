//
//  NewProductsTableViewCell.swift
//  FinalProject
//
//  Created by Ahmed Serdah on 7/22/17.
//  Copyright © 2017 iOS-WWB. All rights reserved.
//

import UIKit

class NewProductsTableViewCell: UITableViewCell {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var lbItem: UILabel!
    @IBOutlet weak var lbItemNo: UILabel!
    
    @IBOutlet weak var ItemCollectionView: UICollectionView!
    
    let imageNames = ["watch", "pic-1", "pic-1", "watch", "pic-1", "pic-1", "watch","pic-1","watch"]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
               // Initialization code
        ItemCollectionView.delegate = self as UICollectionViewDelegate
        
        ItemCollectionView.dataSource = self as UICollectionViewDataSource
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
//extension NewProductsTableViewCell {
//    
//    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
//        
//        ItemCollectionView.delegate = dataSourceDelegate
//        ItemCollectionView.dataSource = dataSourceDelegate
//        ItemCollectionView.tag = row
//        ItemCollectionView.setContentOffset(ItemCollectionView.contentOffset, animated:false) // Stops collection view if it was scrolling.
//        
//        ItemCollectionView.reloadData()
//    }
//    
//    var collectionViewOffset: CGFloat {
//        set { ItemCollectionView.contentOffset.x = newValue }
//        get { return ItemCollectionView.contentOffset.x }
//    }

    extension NewProductsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return 9
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            //
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as!  CustomCollectionCell
            
            //What is this CustomCollectionCell? Create a CustomCell with SubClass of UICollectionViewCell
            //Load images w.r.t IndexPath
         //   cell.collectionImageView.image = UIImage(named: imageNames[indexPath.row])
            
          //  cell.collectionImageTitleLbl.text = gameNames[indexPath.row]
            
            cell.CollectonCellImage.image = UIImage(named: imageNames[indexPath.row])
            
            
            
            return cell
            
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
       //     let clickedIndex = imageNames[indexPath.row]
            
         //   print(clickedIndex)
            
        }
        
    }

