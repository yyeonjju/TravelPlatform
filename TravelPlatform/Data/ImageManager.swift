//
//  ImageManager.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/26/24.
//

import Foundation

struct ImageManager {
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL, completion: @escaping (_ data : Data) -> Void ) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
//            print(response?.suggestedFilename ?? url.lastPathComponent)
//            print("Download Finished")
            completion(data)
        }
    }
    
}
