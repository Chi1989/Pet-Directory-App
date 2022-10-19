//
//  Extension+SecondViewController.swift
//  Pet Directory App
//
//  Created by Mac on 19/10/2022.
//

import Foundation
import UIKit

//MARK: - Extension of SecondViewController CollectionView protocols
extension SecondViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        return cell
    }
}
