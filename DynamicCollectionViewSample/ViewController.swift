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
    
    var itemsArr: [String]
        = ["Hi I am very good","Hi I am very good Hi I am very good Hi I am very good","Hi I am very good Hi I am very good Hi I am very good Hi I am very good", "Hi I am very good  Hi I am very good Hi I am very good Hi I am very good Hi I am very good Hi I am very good Hi I am very good"]
    
   
   var imageArr = [UIImage(named: "image1"),UIImage(named: "image2"),UIImage(named: "image3"),UIImage(named: "image4")]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib.init(nibName: "DynamicImageCell", bundle: nil), forCellWithReuseIdentifier: "DynamicImageCell")
//        collectionView.register(UINib.init(nibName: "DynamicCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DynamicCollectionViewCell")
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
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DynamicImageCell", for: indexPath) as! DynamicImageCell
        cell.dynamicImageView.contentMode = .scaleAspectFit
        cell.dynamicImageView.image = imageArr[indexPath.row]
        cell.dynamicImageView.frame = CGRect(x: 0, y: 0, width: cell.dynamicImageView.image!.size.width, height: cell.dynamicImageView.image!.size.height)
        cell.contentView.frame = cell.dynamicImageView.frame
      //  cell.textLabel.text = itemsArr[indexPath.row]
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        guard let image = imageArr[indexPath.row] else {
            return CGSize(width: 0, height: 0)
        }
       
        return CGSize(width: image.size.width, height: image.size.height)
    }
}




