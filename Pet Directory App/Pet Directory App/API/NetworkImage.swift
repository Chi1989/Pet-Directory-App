//
//  NetworkImage.swift
//  Pet Directory App
//
//  Created by Mac on 19/10/2022.
//

import Foundation
import UIKit

class Converter {
    fileprivate let downloadQueue = DispatchQueue(label: "Images cache", qos: DispatchQoS.background)
    
    //MARK: - Fetch image from URL and Images cache
    
    func loadImages(from url: URL, completion: @escaping (_ image: UIImage) -> Void) {
        
        downloadQueue.async(execute: { () -> Void in
            
            do{
                
                let data = try Data(contentsOf: url)
                
                if let image = UIImage(data: data) {
                    
                    DispatchQueue.main.async { completion(image) }
                    
                } else { print("Could not decode image") }
                
            }catch { print("Could not load URL: \(url): \(error)") }
            
        })
        
    }
    
    func requestImage(from url: URL, completion: @escaping (_ image: UIImage) -> Void){
        
        //MARK: - Calling here another function and returning data completion
        
        loadImages(from: url, completion: completion)
    }
}

