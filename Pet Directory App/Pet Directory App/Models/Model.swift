//
//  Model.swift
//  Pet Directory App
//
//  Created by Mac on 19/10/2022.
//

import Foundation
import UIKit

struct Breed: Codable {
    let name: String
    var image: BreedImage?
    
    enum CodingKeys: String, CodingKey {
        case name
        case image
    }
}

struct BreedImage: Codable {
    let url: String?
    let height: Int?
    let id: String?
    let width: Int?
}

typealias CatBreed = [Breed]



