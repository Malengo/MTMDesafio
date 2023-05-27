//
//  ListCharactersCell.swift
//  MTMDesafio
//
//  Created by Jose Malengo on 20/05/23.
//

import UIKit

class ListCharactersCell: UITableViewCell, ViewCodeProtocol {
    
    //MARK: - Inits
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK - Components
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.axis = .horizontal
        stack.backgroundColor = .systemGray6
        stack.spacing = 8
        stack.clipsToBounds = true
        stack.layer.cornerRadius = 5
        stack.translatesAutoresizingMaskIntoConstraints =  false
        return stack
    }()
    
    lazy var infoStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.spacing = 9
        stack.axis = .vertical
        return stack
    }()
    
    lazy var bottomInfoStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.spacing = 3
        return stack
    }()
    
    lazy var charImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints =  false
        image.image = UIImage(systemName: "person")
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Light", size: 12.0)
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Char"
        return label
    }()
    
    lazy var speciesLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Light", size: 12.0)
        label.text = "Human"
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Light", size: 13.0)
        label.text = "Alive"
        return label
    }()
    
    lazy var genderLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Light", size: 13.0)
        label.text = "Male"
        return label
    }()
    
    lazy var genderImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints =  false
        image.image = UIImage(systemName: "suit.heart.fill")
        image.layer.cornerRadius = 9
        return image
    }()
    
    lazy var statusImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints =  false
        image.tintColor = .red
        image.image = UIImage(systemName: "person")
        image.layer.cornerRadius = 9
        return image
    }()
    
    func buildViewHierachy() {
        addSubview(mainStack)
        mainStack.addArrangedSubview(charImage)
        mainStack.addArrangedSubview(infoStack)
        
        infoStack.addArrangedSubview(nameLabel)
        infoStack.addArrangedSubview(speciesLabel)
        infoStack.addArrangedSubview(bottomInfoStack)
        
        bottomInfoStack.addArrangedSubview(statusImage)
        bottomInfoStack.addArrangedSubview(statusLabel)
        bottomInfoStack.addArrangedSubview(genderImage)
        bottomInfoStack.addArrangedSubview(genderLabel)
        
    }
    
    func setupCpnstraints() {
        NSLayoutConstraint.activate([
            mainStack.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 9),
            mainStack.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -9),
            mainStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 9),
            mainStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -9),
            
            charImage.topAnchor.constraint(equalTo: mainStack.topAnchor),
            charImage.bottomAnchor.constraint(equalTo: mainStack.bottomAnchor),
            charImage.widthAnchor.constraint(equalToConstant: 50),
            
            bottomInfoStack.rightAnchor.constraint(equalTo: infoStack.rightAnchor),
            
            statusImage.heightAnchor.constraint(equalToConstant: 12),
            statusImage.widthAnchor.constraint(equalToConstant: 12),
            
            genderImage.widthAnchor.constraint(equalToConstant: 12),
            genderImage.heightAnchor.constraint(equalToConstant: 12)
        ])
    }
    
    func addictionalConfiguration() {
    }
    
    func setupCellInformation(with character: Character) {
        configureImageFrom(url: character.image ?? "")
        nameLabel.text = character.name
        speciesLabel.text = character.species
        genderLabel.text = character.gender
        statusLabel.text = character.status
        statusImage.tintColor = character.status == "Alive" ? .blue : .red
        genderImage.image = character.gender == "Male" ? UIImage(systemName: "suit.spade.fill") : UIImage(systemName: "suit.heart.fill")
        genderImage.tintColor = character.gender == "Male" ? .blue : .red
    }
    
    private func configureImageFrom(url: String) {
        if let url = URL(string: url) {
                self.charImage.loadImageData(url)
        }
    }
    
}
