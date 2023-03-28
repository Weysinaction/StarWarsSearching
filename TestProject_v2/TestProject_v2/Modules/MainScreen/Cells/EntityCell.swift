//
//  StarshipCell.swift
//  TestProject_v2
//
//  Created by Dima Lazarev on 22.03.2023.
//

import UIKit

protocol EntityCellDelegate {
    func deleteRow(index: Int)
}

class EntityCell: UITableViewCell {
    //MARK: - Public properties
    var delegate: EntityCellDelegate?
    
    //MARK: - Private properties
    private var titleLabel: UILabel?
    private var cellImageView: UIImageView?
    private var favoriteButton: UIButton?
    private var firstLinePlaceholderLabel: UILabel?
    private var secondLinePlaceholderLabel: UILabel?
    private var thirdLinePlaceholderLabel: UILabel?
    private var fourthLinePlaceholderLabel: UILabel?
    private var isFavorite = false
    private var firstLineLabel: UILabel?
    private var secondLineLabel: UILabel?
    private var thirdLineLabel: UILabel?
    private var fourthLineLabel: UILabel?
    private var entity: Entity?

    //MARK: - EntityCell
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupImageView()
        self.setupLabels()
        self.setupButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public methods
    func updateCell(entity: Entity) {
        self.entity = entity
        firstLineLabel?.text = entity.firstLine
        secondLineLabel?.text = entity.secondLine
        thirdLineLabel?.text = entity.thirdLine
        fourthLineLabel?.text = entity.fourthLine
        isFavorite = entity.isFavorite ?? false
        if isFavorite {
            let favoriteImage = UIImage(named: "blackHeart")
            favoriteButton?.setImage(favoriteImage, for: .normal)
        } else {
            let notFavoriteImage = UIImage(named: "heart")
            favoriteButton?.setImage(notFavoriteImage, for: .normal)
        }
        switch entity.entityType {
        case .person: secondLinePlaceholderLabel?.text = "Gender:"
            thirdLinePlaceholderLabel?.text = "Starships:"
            titleLabel?.text = "Person"
            cellImageView?.image = UIImage(named: "person")
            fourthLineLabel?.isHidden = true
            fourthLinePlaceholderLabel?.isHidden = true
        case .starship: secondLinePlaceholderLabel?.text = "Model:"
            thirdLinePlaceholderLabel?.text = "Manufacturer:"
            titleLabel?.text = "Starship"
            cellImageView?.image = UIImage(named: "starship")
            fourthLineLabel?.isHidden = false
            fourthLinePlaceholderLabel?.isHidden = false
        default: return
        }
    }
    
    //MARK: - Private methods
    private func setupLabels() {
        let titleLabel = UILabel()
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: cellImageView?.trailingAnchor ?? self.leadingAnchor, constant: 5).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        titleLabel.text = "Starship"
        titleLabel.font = UIFont(name: "abosanova", size: 19)
        titleLabel.textColor = .systemGray
        self.titleLabel = titleLabel
        
        let firstLinePlaceholderLabel = UILabel()
        contentView.addSubview(firstLinePlaceholderLabel)
        firstLinePlaceholderLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLinePlaceholderLabel.topAnchor.constraint(equalTo: cellImageView?.bottomAnchor ?? self.topAnchor, constant: 5).isActive = true
        firstLinePlaceholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        firstLinePlaceholderLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        firstLinePlaceholderLabel.text = "Name:"
        firstLinePlaceholderLabel.textColor = .systemGray
        self.firstLinePlaceholderLabel = firstLinePlaceholderLabel
        
        let secondLinePlaceholderLabel = UILabel()
        contentView.addSubview(secondLinePlaceholderLabel)
        secondLinePlaceholderLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLinePlaceholderLabel.topAnchor.constraint(equalTo: firstLinePlaceholderLabel.bottomAnchor, constant: 5).isActive = true
        secondLinePlaceholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        secondLinePlaceholderLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        secondLinePlaceholderLabel.text = "Model:"
        secondLinePlaceholderLabel.textColor = .systemGray
        self.secondLinePlaceholderLabel = secondLinePlaceholderLabel
        
        let thirdLinePlaceholderLabel = UILabel()
        contentView.addSubview(thirdLinePlaceholderLabel)
        thirdLinePlaceholderLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdLinePlaceholderLabel.topAnchor.constraint(equalTo: secondLinePlaceholderLabel.bottomAnchor, constant: 5).isActive = true
        thirdLinePlaceholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        thirdLinePlaceholderLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        thirdLinePlaceholderLabel.text = "Manufacturer:"
        thirdLinePlaceholderLabel.textColor = .systemGray
        self.thirdLinePlaceholderLabel = thirdLinePlaceholderLabel
        
        let fourthLinePlaceholderLabel = UILabel()
        contentView.addSubview(fourthLinePlaceholderLabel)
        fourthLinePlaceholderLabel.translatesAutoresizingMaskIntoConstraints = false
        fourthLinePlaceholderLabel.topAnchor.constraint(equalTo: thirdLinePlaceholderLabel.bottomAnchor, constant: 5).isActive = true
        fourthLinePlaceholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        fourthLinePlaceholderLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        fourthLinePlaceholderLabel.text = "Passengers:"
        fourthLinePlaceholderLabel.textColor = .systemGray
        self.fourthLinePlaceholderLabel = fourthLinePlaceholderLabel
        
        let firstLineLabel = UILabel()
        contentView.addSubview(firstLineLabel)
        firstLineLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLineLabel.topAnchor.constraint(equalTo: firstLinePlaceholderLabel.topAnchor).isActive = true
        firstLineLabel.leadingAnchor.constraint(equalTo: firstLinePlaceholderLabel.trailingAnchor, constant: 5).isActive = true
        firstLineLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.firstLineLabel = firstLineLabel
        
        let secondLineLabel = UILabel()
        contentView.addSubview(secondLineLabel)
        secondLineLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLineLabel.topAnchor.constraint(equalTo: firstLineLabel.bottomAnchor, constant: 5).isActive = true
        secondLineLabel.leadingAnchor.constraint(equalTo: secondLinePlaceholderLabel.trailingAnchor, constant: 5).isActive = true
        secondLineLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.secondLineLabel = secondLineLabel
        
        let thirdLineLabel = UILabel()
        contentView.addSubview(thirdLineLabel)
        thirdLineLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdLineLabel.topAnchor.constraint(equalTo: secondLineLabel.bottomAnchor, constant: 5).isActive = true
        thirdLineLabel.leadingAnchor.constraint(equalTo: thirdLinePlaceholderLabel.trailingAnchor, constant: 5).isActive = true
        thirdLineLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.thirdLineLabel = thirdLineLabel
        
        let fourthLineLabel = UILabel()
        contentView.addSubview(fourthLineLabel)
        fourthLineLabel.translatesAutoresizingMaskIntoConstraints = false
        fourthLineLabel.topAnchor.constraint(equalTo: thirdLineLabel.bottomAnchor, constant: 5).isActive = true
        fourthLineLabel.leadingAnchor.constraint(equalTo: fourthLinePlaceholderLabel.trailingAnchor, constant: 5).isActive = true
        fourthLineLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.fourthLineLabel = fourthLineLabel
    }
    
    private func setupImageView() {
        let image = UIImage(named: "starship")
        let cellImageView = UIImageView(image: image)
        contentView.addSubview(cellImageView)
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        cellImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        cellImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20).isActive = true
        cellImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        cellImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        cellImageView.contentMode = .scaleToFill
        self.cellImageView = cellImageView
    }
    
    private func setupButtons() {
        let favoriteImage = UIImage(named: "heart")
        let favoriteButton = UIButton(frame: .zero)
        favoriteButton.setImage(favoriteImage, for: .normal)
        contentView.addSubview(favoriteButton)
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 7).isActive = true
        favoriteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        favoriteButton.backgroundColor = .clear
        favoriteButton.contentMode = .scaleToFill
        favoriteButton.addTarget(self, action: #selector(favoriteButtonPressed), for: .touchUpInside)
        self.favoriteButton = favoriteButton
    }

    private func toggleFavorite() {
        let favoriteImage = UIImage(named: "heart")
        let favoriteImagePressed = UIImage(named: "blackHeart")
        isFavorite = !isFavorite
        switch isFavorite {
        case true: favoriteButton?.setImage(favoriteImagePressed, for: .normal)
        case false: favoriteButton?.setImage(favoriteImage, for: .normal)
        }
    }
    
    private func addToFavorite(entity: MainScreenModelProtocol?) {
        guard var entity = entity as? Entity  else { return }
        let model = FavoritesModel.shared
        entity.isFavorite = true
        model.favoriteModels.append(entity)
    }
    
    private func deleteFromFavorite(entity: MainScreenModelProtocol?) {
        guard let entity = entity as? Entity else { return }
        let model = FavoritesModel.shared
        let deleteIndex = model.favoriteModels.firstIndex(where: { currentEntity in
            currentEntity.firstLine == entity.firstLine
        })
        guard let deleteIndex = deleteIndex else { return }
        model.favoriteModels.remove(at: deleteIndex)
        delegate?.deleteRow(index: deleteIndex)
    }
    
    //MARK: Selectors
    @objc func favoriteButtonPressed(sender: UIButton) {
        if isFavorite {
            deleteFromFavorite(entity: entity)
        } else {
            addToFavorite(entity: entity)
        }
        toggleFavorite()
    }
}
