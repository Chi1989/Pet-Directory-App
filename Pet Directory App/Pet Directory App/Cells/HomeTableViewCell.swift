//
//  HomeTableViewCell.swift
//  Pet Directory App
//
//  Created by Mac on 19/10/2022.
//

import UIKit
//MARK: - Object properties and values for the HomeTableViewCells
class HomeTableViewCell: UITableViewCell {
    
    var identifier = "Cell"
    
    lazy var catImage:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 10
        img.heightAnchor.constraint(equalToConstant: 40).isActive = true
        img.widthAnchor.constraint(equalToConstant: 40).isActive = true
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
        btn.setTitleColor(UIColor.systemGray6, for: .normal)
        btn.setImage(UIImage(named: "lightHeart"), for: .normal)
        btn.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func btnTapped() {
        if likeButton.isSelected == true {
            likeButton.setImage(UIImage(named: "redHeart"), for: .highlighted)
        }else if likeButton.isSelected == false{
            likeButton.setImage(UIImage(named: "lightHeart"), for: .normal)
        }
    }
    
    func setupViews() {
        self.addSubview(catImage)
        self.addSubview(catName)
        self.addSubview(likeButton)
        
        NSLayoutConstraint.activate([
            catImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            catImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            
            catName.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            catName.leadingAnchor.constraint(equalTo: catImage.trailingAnchor, constant: 15),
            
            likeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            likeButton.leadingAnchor.constraint(equalTo: catImage.trailingAnchor, constant: 230),
        ])
    }
}
