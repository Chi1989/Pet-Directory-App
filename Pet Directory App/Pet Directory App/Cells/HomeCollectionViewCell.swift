//
//  HomeCollectionViewCell.swift
//  Pet Directory App
//
//  Created by Mac on 19/10/2022.
//

import UIKit

//MARK: - Object properties and values for the HomeCollectionViewCell
class HomeCollectionViewCell: UICollectionViewCell {
    
    let identifier = "CollectionViewCell"
    
    lazy var catImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 10
        img.heightAnchor.constraint(equalToConstant: 150).isActive = true
        img.widthAnchor.constraint(equalToConstant: 150).isActive = true
        img.clipsToBounds = true
        
        return img
    }()
    
    lazy var catName:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor =  .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var likeButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "likelightcolor"), for: .normal)
        btn.setTitleColor(UIColor.systemGray6, for: .normal)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setting the constraints
    func setupViews() {
        self.addSubview(catImage)
        self.addSubview(catName)
        self.addSubview(likeButton)
        
        NSLayoutConstraint.activate([
            catImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            catImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            
            catName.topAnchor.constraint(equalTo: catImage.bottomAnchor, constant: 5),
            catName.leadingAnchor.constraint(equalTo: catImage.leadingAnchor, constant: 25),
            
            likeButton.topAnchor.constraint(equalTo: catImage.topAnchor, constant: 5),
            likeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 2),
        ])
    }
}
