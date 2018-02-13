//
//  iteminfoViewController.swift
//  FinalProject
//
//  Created by iOS-WWB on 7/27/17.
//  Copyright © 2017 iOS-WWB. All rights reserved.
//

import UIKit
import ImageSlideshow

class iteminfoViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var itemsCollection: UICollectionView!
        @IBOutlet weak var colorCollectionView: UICollectionView!
    
   
    
    @IBOutlet var slideshow: ImageSlideshow!
    
    let localSource = [ImageSource(imageString: "img1")!, ImageSource(imageString: "img2")!, ImageSource(imageString: "img3")!, ImageSource(imageString: "img4")!]
  
    let kingfisherSource = [KingfisherSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, KingfisherSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, KingfisherSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]

    override func viewDidLoad() {
        super.viewDidLoad()
        slideshow.backgroundColor = UIColor.white
        slideshow.slideshowInterval = 5.0
        slideshow.pageControlPosition = PageControlPosition.underScrollView
        slideshow.pageControl.currentPageIndicatorTintColor = UIColor.blue
        slideshow.pageControl.pageIndicatorTintColor = UIColor.black
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        slideshow.activityIndicator = DefaultActivityIndicator()
        slideshow.currentPageChanged = { page in
            print("current page:", page)
        }
        
        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        slideshow.setImageInputs(kingfisherSource)
        
      //  let recognizer = UITapGestureRecognizer(target: self, action: #selector(iteminfoViewController.didTap))
      //  slideshow.addGestureRecognizer(recognizer)
   
    
    func didTap() {
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }        // Do any additional setup after loading the view.
        self.itemsCollection.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: "itemCell")

        
        let nib = UINib(nibName: "ItemCollectionViewCell", bundle: nil)
        self.itemsCollection!.register(nib, forCellWithReuseIdentifier: "itemCell")
        
      
     
 
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var num:Int
        if(collectionView == self.itemsCollection){
            num = 4
        }
        else {
            num = 3
        }
        return  num
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell: UICollectionViewCell
            
        if(collectionView == self.itemsCollection){
            cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath)
        }
        else{
            cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "colorCell", for: indexPath)
        }
        
        // Configure the cell
        
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width:CGSize
        
        if(collectionView == self.itemsCollection){
            
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
            layout.minimumInteritemSpacing = 8
            layout.minimumLineSpacing = 8
            self.itemsCollection?.collectionViewLayout = layout
            width = CGSize(width:(UIScreen.main.bounds.width - 24 ) / 2, height: 225)
            
          

        }
         else{
            width =  CGSize(width:20,height:20)
        }
        return width
        
    }
    

}
