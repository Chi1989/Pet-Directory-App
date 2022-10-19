//
//  Extension+HomeViewController.swift
//  Pet Directory App
//
//  Created by Mac on 19/10/2022.
//

import Foundation
import UIKit

//MARK: - Extension of HomeViewController TableView protocols
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomeTableViewCell
        
        let cats = catData[indexPath.item]
        DispatchQueue.main.async {
            let imageProvider = Converter()
            imageProvider.requestImage(from: URL(string:cats.image?.url ?? "cat1")!) { image in
                cell.catImage.image = image
            }
        }
        cell.catName.text = cats.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nextVC = SecondViewController()
        var cats = catData[indexPath.row]
        DispatchQueue.main.async {
            let imageProvider = Converter()
            imageProvider.requestImage(from: URL(string:cats.image?.url ?? "cat1")!) { image in
                cats.image = cats.image
                nextVC.catData = cats.image
                nextVC.modalPresentationStyle = .fullScreen
                self.navigationController?.present(nextVC, animated: true)
            }
        }
    }
}
