//
//  StarshipCell.swift
//  TestProject_v2
//
//  Created by Dima Lazarev on 22.03.2023.
//

import UIKit

class EntityCell: UITableViewCell {
    var titleLabel: UILabel?
    var cellImageView: UIImageView?
    var favoriteButton: UIButton?
    var firstLinePlaceholderLabel: UILabel?
    var secondLinePlaceholderLabel: UILabel?
    var thirLinePlaceholderLabel: UILabel?
    var fourthLinePlaceholderLabel: UILabel?
    var isFavorite = false
    var firstLineLabel: UILabel?
    var secondLineLabel: UILabel?
    var thirdLineLabel: UILabel?
    var fourthLineLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupImageView()
        self.setupLabels()
        self.setupButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        firstLineLabel?.text = ""
        secondLineLabel?.text = ""
        thirdLineLabel?.text = ""
        fourthLineLabel?.text = ""
        isFavorite = false
    }
    
    //MARK: Setup Methods
    func setupLabels() {
        let titleLabel = UILabel()
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: cellImageView?.trailingAnchor ?? self.leadingAnchor, constant: 5).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        //titleLabel.text = "Starship"
        titleLabel.font = UIFont(name: "abosanova", size: 19)
        titleLabel.textColor = .systemGray
        self.titleLabel = titleLabel
        
        let firstLinePlaceholderLabel = UILabel()
        addSubview(firstLinePlaceholderLabel)
        firstLinePlaceholderLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLinePlaceholderLabel.topAnchor.constraint(equalTo: cellImageView?.bottomAnchor ?? self.topAnchor, constant: 5).isActive = true
        firstLinePlaceholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        firstLinePlaceholderLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        //firstLinePlaceholderLabel.text = "Name:"
        firstLinePlaceholderLabel.textColor = .systemGray
        self.firstLinePlaceholderLabel = firstLinePlaceholderLabel
        
        let secondLinePlaceholderLabel = UILabel()
        addSubview(secondLinePlaceholderLabel)
        secondLinePlaceholderLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLinePlaceholderLabel.topAnchor.constraint(equalTo: firstLinePlaceholderLabel.bottomAnchor, constant: 5).isActive = true
        secondLinePlaceholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        secondLinePlaceholderLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        //secondLinePlaceholderLabel.text = "Model:"
        secondLinePlaceholderLabel.textColor = .systemGray
        self.secondLinePlaceholderLabel = secondLinePlaceholderLabel
        
        let thirdLinePlaceholderLabel = UILabel()
        addSubview(thirdLinePlaceholderLabel)
        thirdLinePlaceholderLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdLinePlaceholderLabel.topAnchor.constraint(equalTo: secondLinePlaceholderLabel.bottomAnchor, constant: 5).isActive = true
        thirdLinePlaceholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        thirdLinePlaceholderLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        //thirdLinePlaceholderLabel.text = "Manufacturer:"
        thirdLinePlaceholderLabel.textColor = .systemGray
        self.thirLinePlaceholderLabel = thirdLinePlaceholderLabel
        
        let fourthLinePlaceholderLabel = UILabel()
        addSubview(fourthLinePlaceholderLabel)
        fourthLinePlaceholderLabel.translatesAutoresizingMaskIntoConstraints = false
        fourthLinePlaceholderLabel.topAnchor.constraint(equalTo: thirdLinePlaceholderLabel.bottomAnchor, constant: 5).isActive = true
        fourthLinePlaceholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        fourthLinePlaceholderLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        //fourthLinePlaceholderLabel.text = "Passengers:"
        fourthLinePlaceholderLabel.textColor = .systemGray
        self.fourthLinePlaceholderLabel = fourthLinePlaceholderLabel
        
        let firstLineLabel = UILabel()
        addSubview(firstLineLabel)
        firstLineLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLineLabel.topAnchor.constraint(equalTo: firstLinePlaceholderLabel.topAnchor).isActive = true
        firstLineLabel.leadingAnchor.constraint(equalTo: firstLinePlaceholderLabel.trailingAnchor, constant: 5).isActive = true
        firstLineLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        //firstLineLabel.text = "Millennium Falcon"
        self.firstLineLabel = firstLineLabel
        
        let secondLineLabel = UILabel()
        addSubview(secondLineLabel)
        secondLineLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLineLabel.topAnchor.constraint(equalTo: firstLineLabel.bottomAnchor, constant: 5).isActive = true
        secondLineLabel.leadingAnchor.constraint(equalTo: secondLinePlaceholderLabel.trailingAnchor, constant: 5).isActive = true
        secondLineLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        //secondLineLabel.text = "YT-1300 light freighter"
        self.secondLineLabel = secondLineLabel
        
        let thirdLineLabel = UILabel()
        addSubview(thirdLineLabel)
        thirdLineLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdLineLabel.topAnchor.constraint(equalTo: secondLineLabel.bottomAnchor, constant: 5).isActive = true
        thirdLineLabel.leadingAnchor.constraint(equalTo: thirdLinePlaceholderLabel.trailingAnchor, constant: 5).isActive = true
        thirdLineLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        //thirdLineLabel.text = "Corellian Engineering Corporation"
        self.thirdLineLabel = thirdLineLabel
        
        let fourthLineLabel = UILabel()
        addSubview(fourthLineLabel)
        fourthLineLabel.translatesAutoresizingMaskIntoConstraints = false
        fourthLineLabel.topAnchor.constraint(equalTo: thirdLineLabel.bottomAnchor, constant: 5).isActive = true
        fourthLineLabel.leadingAnchor.constraint(equalTo: fourthLinePlaceholderLabel.trailingAnchor, constant: 5).isActive = true
        fourthLineLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        //fourthLineLabel.text = "6"
        self.fourthLineLabel = fourthLineLabel
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
        favoriteButton.setImage(favoriteImage, for: .normal)
        addSubview(favoriteButton)
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 7).isActive = true
        favoriteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        favoriteButton.backgroundColor = .clear
        favoriteButton.contentMode = .scaleToFill
        favoriteButton.isUserInteractionEnabled = true
        favoriteButton.addTarget(self, action: #selector(favoriteButtonPressed), for: .touchDown)
        self.favoriteButton = favoriteButton
    }

    func toggleFavorite() {
        let favoriteImage = UIImage(named: "heart")
        let favoriteImagePressed = UIImage(named: "blackHeart")
        isFavorite = !isFavorite
        switch isFavorite {
        case true: favoriteButton?.setImage(favoriteImagePressed, for: .normal)
        case false: favoriteButton?.setImage(favoriteImage, for: .normal)
        }
    }
    
    //MARK: Selectors
    @objc func favoriteButtonPressed(sender: UIButton) {
        //toggleFavorite()
    }
    
    func updateCell(entity: MainScreenModelProtocol) {
        firstLineLabel?.text = entity.firstLine
        secondLineLabel?.text = entity.secondLine
        thirdLineLabel?.text = entity.thirdLine
        fourthLineLabel?.text = entity.fourthLine
        isFavorite = entity.isFavorite ?? false
        if entity.entityType == .person {
            firstLinePlaceholderLabel?.text = "Name:"
            secondLinePlaceholderLabel?.text = "Gender:"
            thirLinePlaceholderLabel?.text = "Starships:"
            titleLabel?.text = "Person"
            fourthLineLabel?.isHidden = true
            fourthLinePlaceholderLabel?.isHidden = true
        } else if entity.entityType == .starship {
            firstLinePlaceholderLabel?.text = "Name:"
            secondLinePlaceholderLabel?.text = "Model:"
            thirLinePlaceholderLabel?.text = "Manufacturer:"
            fourthLinePlaceholderLabel?.text = "Passengers:"
            titleLabel?.text = "Starship"
            fourthLineLabel?.isHidden = false
            fourthLinePlaceholderLabel?.isHidden = false
        }
        if isFavorite {
            let favoriteImage = UIImage(named: "blackHeart")
            favoriteButton?.setImage(favoriteImage, for: .normal)
        } else {
            let notFavoriteImage = UIImage(named: "heart")
            favoriteButton?.setImage(notFavoriteImage, for: .normal)
        }
    }
}
