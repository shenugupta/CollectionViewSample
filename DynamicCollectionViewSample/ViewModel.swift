//
//  ViewModel.swift
//  DynamicCollectionViewSample
//
//  Created by pankajsahni on 05/08/20.
//  Copyright © 2020 pankajsahni. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    
    func  fetchDataFromServer() {
        guard let url = URL(string: "https://learnappmaking.com/ex/users.json") else {
            return
        }
         URLSession.shared.dataTask(with: url, completionHandler: { data,response,error in
            if error != nil || data == nil {
                print("Client Error!")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server Error")
                return
            }
            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong Mime Type!")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print(json)
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }).resume()
    }
}
