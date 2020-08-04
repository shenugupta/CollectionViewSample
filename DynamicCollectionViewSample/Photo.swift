//
//  Photo.swift
//  DynamicCollectionViewSample
//
//  Created by pankajsahni on 03/08/20.
//  Copyright © 2020 pankajsahni. All rights reserved.
//

import UIKit

class Photo {
    var caption: String
    var comment: String
    var image: UIImage
    
    init(caption: String, comment: String, image: UIImage) {
        self.caption = caption
        self.comment = comment
        self.image = image
    }
    
    convenience init?(dictionary: [String:String]) {
        guard
          let caption = dictionary["Caption"],
          let comment = dictionary["Comment"],
          let photo = dictionary["Photo"],
          let image = UIImage(named:photo)
            else {
                return nil
        }
        self.init(caption: caption, comment: comment, image: image)
    }
    
    static func allPhotos() -> [Photo] {
        var photos: [Photo] = []
        guard
           let plistURL = Bundle.main.url(forResource: "Photos" , withExtension: "plist"),
           let photosFromPlist = NSArray(contentsOf: plistURL) as? [[String: String]]
            else {
               return photos
           }
        
        for dict in photosFromPlist {
            if let photo = Photo(dictionary: dict) {
                photos.append(photo)
            }
        }
     return photos
    }
  }

