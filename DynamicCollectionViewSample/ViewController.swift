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
    
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout! {
        didSet {
            collectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    var itemsArr = ["Hi I am very good","Hi I am very good Hi I am very good Hi I am very good","Hi I am very good Hi I am very good Hi I am very good Hi I am very good", "Hi I am very good  Hi I am very good Hi I am very good Hi I am very good Hi I am very good Hi I am very good Hi I am very good"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib.init(nibName: "DynamicCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DynamicCollectionViewCell")
       
        collectionView.reloadData()
        // Do any additional setup after loading the view.
    }
}


extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return itemsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DynamicCollectionViewCell", for: indexPath) as! DynamicCollectionViewCell
        cell.textLabel.text = itemsArr[indexPath.row]
        return cell
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
}

