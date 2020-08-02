//
//  ViewController.swift
//  DynamicCollectionViewSample
//
//  Created by pankajsahni on 01/08/20.
//  Copyright © 2020 pankajsahni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var itemsArr = ["Hi I am very good","Hi I am very good Hi I am very good Hi I am very good","Hi I am very good Hi I am very good Hi I am very good Hi I am very good", "Hi I am very good  Hi I am very good Hi I am very good Hi I am very good Hi I am very good Hi I am very good Hi I am very good"]
    
   
   var imageArr = [UIImage(named: "10262165_stock-photo-holiday-burning-multicolored-candles-of-different-height"),UIImage(named: "five-stacks-coins-different-height-white-background-84931965"),UIImage(named: "images-2"),UIImage(named: "images"),UIImage(named: "stockfresh_id4966754_1d01b6")]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionView.register(UINib.init(nibName: "DynamicImageCell", bundle: nil), forCellWithReuseIdentifier: "DynamicImageCell")
        collectionView.register(UINib.init(nibName: "DynamicCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DynamicCollectionViewCell")
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                   flowLayout.estimatedItemSize = CGSize(width: 1,height: 1)
         }
       
        collectionView.reloadData()
        // Do any additional setup after loading the view.
    }
}


extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return itemsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DynamicImageCell", for: indexPath) as! DynamicImageCell
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DynamicCollectionViewCell", for: indexPath) as! DynamicCollectionViewCell
       // cell.dynamicImageView.image = imageArr[indexPath.row]
        cell.textLabel.text = itemsArr[indexPath.row]
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 0
       }
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 0
       }
    
    
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//
//    }
 
}

//extension ViewController: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return size(for: indexPath)
//    }
//
//    private func size(for indexPath: IndexPath) -> CGSize {
//        // load cell from Xib
//        let cell = Bundle.main.loadNibNamed("DynamicCollectionViewCell", owner: self, options: nil)?.first as! DynamicCollectionViewCell
//        cell.textLabel.text = itemsArr[indexPath.row]
//
//        // configure cell with data in it
//        
//        cell.setNeedsLayout()
//        cell.layoutIfNeeded()
//
//        // width that you want
//        let width = collectionView.frame.width
//        let height: CGFloat = 0
//
//        let targetSize = CGSize(width: width, height: height)
//
//        // get size with width that you want and automatic height
//        let size = cell.contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .defaultHigh, verticalFittingPriority: .fittingSizeLevel)
//        // if you want height and width both to be dynamic use below
//        // let size = cell.contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
//
//        return size
//    }


