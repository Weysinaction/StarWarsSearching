//
//  StarshipCell.swift
//  TestProject_v2
//
//  Created by Dima Lazarev on 22.03.2023.
//

import UIKit

class StarshipCell: UITableViewCell {
    var starshipLabel: UILabel?
    var cellImageView: UIImageView?
    var favoriteButton: UIButton?
    var namePlaceholderLabel: UILabel?
    var modelPlaceholderLabel: UILabel?
    var manufacturerPlaceholderLabel: UILabel?
    var passengersPlaceholderLabel: UILabel?
    var flag = true
    var nameLabel: UILabel?
    var modelLabel: UILabel?
    var manufacturerLabel: UILabel?
    var passengersLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupImageView()
        setupLabels()
        setupButtons()
    }
    
    override func prepareForReuse() {
        flag = true
    }
    
    //MARK: Setup Methods
    func setupLabels() {
        let starshipLabel = UILabel()
        addSubview(starshipLabel)
        starshipLabel.translatesAutoresizingMaskIntoConstraints = false
        starshipLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        starshipLabel.leadingAnchor.constraint(equalTo: cellImageView?.trailingAnchor ?? self.leadingAnchor, constant: 5).isActive = true
        starshipLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        starshipLabel.text = "Starship"
        starshipLabel.font = UIFont(name: "abosanova", size: 19)
        starshipLabel.textColor = .systemGray
        self.starshipLabel = starshipLabel
        
        let namePlaceholderLabel = UILabel()
        addSubview(namePlaceholderLabel)
        namePlaceholderLabel.translatesAutoresizingMaskIntoConstraints = false
        namePlaceholderLabel.topAnchor.constraint(equalTo: cellImageView?.bottomAnchor ?? self.topAnchor, constant: 5).isActive = true
        namePlaceholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        namePlaceholderLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        namePlaceholderLabel.text = "Name:"
        namePlaceholderLabel.textColor = .systemGray
        self.namePlaceholderLabel = namePlaceholderLabel
        
        let modelPlaceholderLabel = UILabel()
        addSubview(modelPlaceholderLabel)
        modelPlaceholderLabel.translatesAutoresizingMaskIntoConstraints = false
        modelPlaceholderLabel.topAnchor.constraint(equalTo: namePlaceholderLabel.bottomAnchor, constant: 5).isActive = true
        modelPlaceholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        modelPlaceholderLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        modelPlaceholderLabel.text = "Model:"
        modelPlaceholderLabel.textColor = .systemGray
        self.modelPlaceholderLabel = modelPlaceholderLabel
        
        let manufacturerPlaceholderLabel = UILabel()
        addSubview(manufacturerPlaceholderLabel)
        manufacturerPlaceholderLabel.translatesAutoresizingMaskIntoConstraints = false
        manufacturerPlaceholderLabel.topAnchor.constraint(equalTo: modelPlaceholderLabel.bottomAnchor, constant: 5).isActive = true
        manufacturerPlaceholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        manufacturerPlaceholderLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        manufacturerPlaceholderLabel.text = "Manufacturer:"
        manufacturerPlaceholderLabel.textColor = .systemGray
        self.manufacturerPlaceholderLabel = manufacturerPlaceholderLabel
        
        let passengersPlaceholderLabel = UILabel()
        addSubview(passengersPlaceholderLabel)
        passengersPlaceholderLabel.translatesAutoresizingMaskIntoConstraints = false
        passengersPlaceholderLabel.topAnchor.constraint(equalTo: manufacturerPlaceholderLabel.bottomAnchor, constant: 5).isActive = true
        passengersPlaceholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        passengersPlaceholderLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        passengersPlaceholderLabel.text = "Passengers:"
        passengersPlaceholderLabel.textColor = .systemGray
        self.passengersPlaceholderLabel = passengersPlaceholderLabel
        
        let nameLabel = UILabel()
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: namePlaceholderLabel.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: namePlaceholderLabel.trailingAnchor, constant: 5).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameLabel.text = "Millennium Falcon"
        self.nameLabel = nameLabel
        
        let modelLabel = UILabel()
        addSubview(modelLabel)
        modelLabel.translatesAutoresizingMaskIntoConstraints = false
        modelLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        modelLabel.leadingAnchor.constraint(equalTo: modelPlaceholderLabel.trailingAnchor, constant: 5).isActive = true
        modelLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        modelLabel.text = "YT-1300 light freighter"
        self.modelLabel = modelLabel
        
        let manufacturerLabel = UILabel()
        addSubview(manufacturerLabel)
        manufacturerLabel.translatesAutoresizingMaskIntoConstraints = false
        manufacturerLabel.topAnchor.constraint(equalTo: modelLabel.bottomAnchor, constant: 5).isActive = true
        manufacturerLabel.leadingAnchor.constraint(equalTo: manufacturerPlaceholderLabel.trailingAnchor, constant: 5).isActive = true
        manufacturerLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        manufacturerLabel.text = "Corellian Engineering Corporation"
        self.manufacturerLabel = manufacturerLabel
        
        let passengersLabel = UILabel()
        addSubview(passengersLabel)
        passengersLabel.translatesAutoresizingMaskIntoConstraints = false
        passengersLabel.topAnchor.constraint(equalTo: manufacturerLabel.bottomAnchor, constant: 5).isActive = true
        passengersLabel.leadingAnchor.constraint(equalTo: passengersPlaceholderLabel.trailingAnchor, constant: 5).isActive = true
        passengersLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        passengersLabel.text = "6"
        self.passengersLabel = passengersLabel
    }
    
    func setupImageView() {
        let image = UIImage(named: "starship")
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
    
    func setupButtons() {
        let favoriteImage = UIImage(named: "heart")
        let favoriteImagePressed = UIImage(named: "blackHeart")
        let favoriteButton = UIButton(frame: .zero)
        if flag {
            favoriteButton.setImage(favoriteImage, for: .normal)
        } else {
            favoriteButton.setImage(favoriteImagePressed, for: .normal)
        }
        addSubview(favoriteButton)
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 7).isActive = true
        favoriteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        favoriteButton.backgroundColor = .clear
        favoriteButton.contentMode = .scaleToFill
        favoriteButton.isUserInteractionEnabled = true
        favoriteButton.addTarget(self, action: #selector(toggleFavoriteButton), for: .touchDown)
        self.favoriteButton = favoriteButton
    }

    
    //MARK: Selectors
    @objc func toggleFavoriteButton(sender: UIButton) {
        let favoriteImage = UIImage(named: "heart")
        let favoriteImagePressed = UIImage(named: "blackHeart")
        if flag {
            favoriteButton?.setImage(favoriteImagePressed, for: .normal)
        } else {
            favoriteButton?.setImage(favoriteImage, for: .normal)
        }
        flag = !flag
    }
}
