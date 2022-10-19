//
//  NetworkManager.swift
//  Pet Directory App
//
//  Created by Mac on 19/10/2022.
//

import Foundation
import UIKit

//MARK: - Network Call for API
class ParseData {
    
    static let instance = ParseData()
    
    func parseData(completionHandler:@escaping ([Breed]) -> Void) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.thecatapi.com/v1/breeds")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse!)
            }
            guard let data = data else {
                print("invalid network")
                return
            }
            let string = String.init(data: data, encoding: .ascii)!.data(using: .utf8)
            let decoder = JSONDecoder()
            let catData = try? decoder.decode([Breed].self, from: string!)
            completionHandler(catData!)
            print(catData!)
        })
        
        dataTask.resume()
    }
    private init() {}
    
}

