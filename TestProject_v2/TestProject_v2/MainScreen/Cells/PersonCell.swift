//
//  MainScreenCell.swift
//  TestProject_v2
//
//  Created by Dima Lazarev on 22.03.2023.
//

import UIKit

class PersonCell: UITableViewCell {
    var cellImageView: UIImageView?
    var personLabel: UILabel?
    var namePlaceholderLabel: UILabel?
    var sexPlaceholderLabel: UILabel?
    var countOfStarshipsPlaceholderLabel: UILabel?
    var nameLabel: UILabel?
    var sexLabel: UILabel?
    var countOfStarshipsLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupImageView()
        setupLabels()
    }
    
    func setupLabels() {
        let personLabel = UILabel()
        addSubview(personLabel)
        personLabel.translatesAutoresizingMaskIntoConstraints = false
        personLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        personLabel.leadingAnchor.constraint(equalTo: cellImageView?.trailingAnchor ?? self.leadingAnchor, constant: 5).isActive = true
        personLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        personLabel.text = "Person"
        personLabel.font = UIFont(name: "abosanova", size: 19)
        personLabel.textColor = .systemGray
        self.personLabel = personLabel
        
        let namePlaceholderLabel = UILabel()
        addSubview(namePlaceholderLabel)
        namePlaceholderLabel.translatesAutoresizingMaskIntoConstraints = false
        namePlaceholderLabel.topAnchor.constraint(equalTo: cellImageView?.bottomAnchor ?? self.topAnchor, constant: 5).isActive = true
        namePlaceholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        namePlaceholderLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        namePlaceholderLabel.text = "Name:"
        namePlaceholderLabel.textColor = .systemGray
        self.namePlaceholderLabel = namePlaceholderLabel
        
        let sexPlaceholderLabel = UILabel()
        addSubview(sexPlaceholderLabel)
        sexPlaceholderLabel.translatesAutoresizingMaskIntoConstraints = false
        sexPlaceholderLabel.topAnchor.constraint(equalTo: namePlaceholderLabel.bottomAnchor, constant: 5).isActive = true
        sexPlaceholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        sexPlaceholderLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        sexPlaceholderLabel.text = "Gender:"
        sexPlaceholderLabel.textColor = .gray
        self.sexPlaceholderLabel = sexPlaceholderLabel
        
        let countOfStarshipsPlaceholderLabel = UILabel()
        addSubview(countOfStarshipsPlaceholderLabel)
        countOfStarshipsPlaceholderLabel.translatesAutoresizingMaskIntoConstraints = false
        countOfStarshipsPlaceholderLabel.topAnchor.constraint(equalTo: sexPlaceholderLabel.bottomAnchor, constant: 5).isActive = true
        countOfStarshipsPlaceholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        countOfStarshipsPlaceholderLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        countOfStarshipsPlaceholderLabel.text = "Starships:"
        countOfStarshipsPlaceholderLabel.textColor = .gray
        self.countOfStarshipsPlaceholderLabel = countOfStarshipsPlaceholderLabel
        
        let nameLabel = UILabel()
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: namePlaceholderLabel.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: namePlaceholderLabel.trailingAnchor, constant: 5).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameLabel.text = "Luke Skywalker"
        self.nameLabel = nameLabel
        
        let sexLabel = UILabel()
        addSubview(sexLabel)
        sexLabel.translatesAutoresizingMaskIntoConstraints = false
        sexLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        sexLabel.leadingAnchor.constraint(equalTo: sexPlaceholderLabel.trailingAnchor, constant: 5).isActive = true
        sexLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        sexLabel.text = "Male"
        self.sexLabel = sexLabel
        
        let countOfStarshipsLabel = UILabel()
        addSubview(countOfStarshipsLabel)
        countOfStarshipsLabel.translatesAutoresizingMaskIntoConstraints = false
        countOfStarshipsLabel.topAnchor.constraint(equalTo: sexLabel.bottomAnchor, constant: 5).isActive = true
        countOfStarshipsLabel.leadingAnchor.constraint(equalTo: countOfStarshipsPlaceholderLabel.trailingAnchor, constant: 5).isActive = true
        countOfStarshipsLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        countOfStarshipsLabel.text = "10"
        self.countOfStarshipsLabel = countOfStarshipsLabel
    }
    
    func setupImageView() {
        let image = UIImage(named: "person")
        let cellImageView = UIImageView(image: image)
        addSubview(cellImageView)
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        cellImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        cellImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20).isActive = true
        cellImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        cellImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        cellImageView.contentMode = .scaleToFill
        self.cellImageView = cellImageView
    }

}