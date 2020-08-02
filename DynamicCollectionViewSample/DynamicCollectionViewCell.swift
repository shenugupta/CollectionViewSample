//
//  DynamicCollectionViewCell.swift
//  DynamicCollectionViewSample
//
//  Created by pankajsahni on 01/08/20.
//  Copyright © 2020 pankajsahni. All rights reserved.
//

import UIKit

class DynamicCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
