//
//  SecondViewController.swift
//  Pet Directory App
//
//  Created by Mac on 19/10/2022.
//

import UIKit
//MARK: - Object properties and values for the SecondViewController
class SecondViewController: UIViewController {
    
    var catData: BreedImage? {
        didSet{
            DispatchQueue.main.async{
                self.collectionView.reloadData()
            }
        }
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "All Cats"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 110, height: 110)
        let collection = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        view.addSubview(collection)
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
    
    //MARK: - Setting the constraints
    func setupViews() {
        
    }
}
