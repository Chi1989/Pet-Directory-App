//
//  HomeViewController.swift
//  Pet Directory App
//
//  Created by Mac on 19/10/2022.
//

import UIKit

//MARK: - Object properties and values for the HomeViewController
class HomeViewController: UIViewController {
    
    var catData = [Breed](){
        didSet{
            DispatchQueue.main.async{
                self.tableView.reloadData()
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
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(HomeTableViewCell.self, forCellReuseIdentifier: "Cell")
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        parseData()
        
    }
    
    func parseData() {
        ParseData.instance.parseData { [weak self] cats in
            self?.catData = cats
        }
    }
    
    //MARK: - Setting the constraints
    func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15)
        ])
    }
}
