//
//  DetailsCharacterView.swift
//  MTMDesafio
//
//  Created by Jose Malengo on 20/05/23.
//

import UIKit

class DetailsCharacterView: UIView, ViewCodeProtocol {
    
    lazy var charImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints =  false
        image.image = UIImage(systemName: "person")
        image.clipsToBounds = true
        image.layer.cornerRadius = 60
        image.layer.borderColor = UIColor.red.cgColor
        image.layer.borderWidth = 5
        return image
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Light", size: 13.0)
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .white
        label.layer.cornerRadius = 4
        label.clipsToBounds = true
        label.backgroundColor = .red
        label.textAlignment = .center
        label.text = "Alive"
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Light", size: 25)
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "Char"
        return label
    }()
    
    lazy var propertiesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Properties"
        return label
    }()
    
    lazy var viewProperties: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillProportionally
        view.spacing = 9
        view.layer.cornerRadius = 9
        view.clipsToBounds = true
        view.backgroundColor = .systemGray6
        return view
    }()
    
    lazy var stackProperties: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 9
        return stack
    }()
    
    lazy var genderLabelProperties: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Light", size: 13.0)
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .white
        label.layer.cornerRadius = 9
        label.clipsToBounds = true
        label.backgroundColor = .systemGray4
        label.textAlignment = .center
        label.text = "Gender"
        return label
    }()
    
    lazy var speciesLabelProperties: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Light", size: 13.0)
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .white
        label.layer.cornerRadius = 9
        label.clipsToBounds = true
        label.backgroundColor = .systemGray4
        label.textAlignment = .center
        label.text = "Species"
        return label
    }()
    
    lazy var statusLabelProperties: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Light", size: 13.0)
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .white
        label.layer.cornerRadius = 9
        label.clipsToBounds = true
        label.backgroundColor = .systemGray4
        label.textAlignment = .center
        label.text = "Status"
        return label
    }()
    
    lazy var stackPropertiesInfo: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 9
        return stack
    }()
    
    lazy var genderLabelPropertiesInfo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Light", size: 13.0)
        label.textColor = .systemBlue
        label.layer.cornerRadius = 9
        label.clipsToBounds = true
        label.backgroundColor = .systemGray4
        label.textAlignment = .center
        label.text = "Gender"
        return label
    }()
    
    lazy var speciesLabelPropertiesInfo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Light", size: 13.0)
        label.textColor = .systemBlue
        label.layer.cornerRadius = 9
        label.clipsToBounds = true
        label.backgroundColor = .systemGray4
        label.textAlignment = .center
        label.text = "Species"
        return label
    }()
    
    lazy var statusLabelPropertiesInfo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Light", size: 13.0)
        label.textColor = .systemBlue
        label.layer.cornerRadius = 9
        label.clipsToBounds = true
        label.backgroundColor = .systemGray4
        label.textAlignment = .center
        label.text = "Status"
        return label
    }()
    
    lazy var originLabelProperties: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Light", size: 13.0)
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .white
        label.layer.cornerRadius = 9
        label.clipsToBounds = true
        label.backgroundColor = .systemGray4
        label.textAlignment = .center
        label.text = "Origin"
        return label
    }()
    
    lazy var locationLabelProperties: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Light", size: 13.0)
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .white
        label.layer.cornerRadius = 9
        label.clipsToBounds = true
        label.backgroundColor = .systemGray4
        label.textAlignment = .center
        label.text = "Location"
        return label
    }()
    
    lazy var originLabelPropertiesInfo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Light", size: 13.0)
        label.textColor = .systemBlue
        label.layer.cornerRadius = 9
        label.clipsToBounds = true
        label.backgroundColor = .systemGray4
        label.textAlignment = .center
        label.text = "hearth"
        return label
    }()
    
    lazy var locationsLabelPropertiesInfo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Light", size: 13.0)
        label.textColor = .systemBlue
        label.layer.cornerRadius = 9
        label.clipsToBounds = true
        label.backgroundColor = .systemGray4
        label.textAlignment = .center
        label.text = "Species"
        return label
    }()
    
    lazy var picker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.backgroundColor = .systemGray5
        picker.clipsToBounds = true
        picker.layer.cornerRadius = 9
        picker.isHidden = true
        return picker
    }()
    
    lazy var buttonEpisode: UIButton = {
        let button = UIButton()
        button.setTitle("Episodes", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func buildViewHierachy() {
        addSubview(charImage)
        addSubview(statusLabel)
        addSubview(nameLabel)
        addSubview(viewProperties)
        addSubview(propertiesLabel)
        addSubview(buttonEpisode)
        addSubview(picker)
        
        viewProperties.addArrangedSubview(stackProperties)
        viewProperties.addArrangedSubview(stackPropertiesInfo)
        
        stackProperties.addArrangedSubview(genderLabelProperties)
        stackProperties.addArrangedSubview(speciesLabelProperties)
        stackProperties.addArrangedSubview(statusLabelProperties)
        stackProperties.addArrangedSubview(originLabelProperties)
        stackProperties.addArrangedSubview(locationLabelProperties)
        
        stackPropertiesInfo.addArrangedSubview(genderLabelPropertiesInfo)
        stackPropertiesInfo.addArrangedSubview(speciesLabelPropertiesInfo)
        stackPropertiesInfo.addArrangedSubview(statusLabelPropertiesInfo)
        stackPropertiesInfo.addArrangedSubview(originLabelPropertiesInfo)
        stackPropertiesInfo.addArrangedSubview(locationsLabelPropertiesInfo)
        
       
    }
    
    func setupCpnstraints() {
        NSLayoutConstraint.activate([
            charImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            charImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            charImage.widthAnchor.constraint(equalToConstant: 120),
            charImage.heightAnchor.constraint(equalToConstant: 120),
            
            statusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            statusLabel.topAnchor.constraint(equalTo: charImage.bottomAnchor, constant: -15),
            statusLabel.widthAnchor.constraint(equalToConstant: 50),
            
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 18),
            
            propertiesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 9),
            propertiesLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            viewProperties.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 18),
            viewProperties.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -18),
            viewProperties.topAnchor.constraint(equalTo: propertiesLabel.bottomAnchor, constant: 10),
            
            stackProperties.widthAnchor.constraint(equalToConstant: 80),
            
            buttonEpisode.topAnchor.constraint(equalTo: stackProperties.bottomAnchor, constant: 9),
            buttonEpisode.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            buttonEpisode.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 18),
            buttonEpisode.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -18),
            
            picker.topAnchor.constraint(equalTo: buttonEpisode.bottomAnchor, constant: 9),
            picker.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 9),
            picker.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -9)
        ])
    }
    
    func addictionalConfiguration() {
        backgroundColor = .systemGray6
    }
    
    func setupInfo(with character: Character) {
        configureImageFrom(url: character.image ?? "")
        nameLabel.text = character.name
        speciesLabelPropertiesInfo.text = character.species
        genderLabelPropertiesInfo.text = character.gender
        statusLabelPropertiesInfo.text = character.status
      //  originLabelPropertiesInfo.text = character.origin?.name
        //locationsLabelPropertiesInfo.text = character.location?.name
        statusLabel.text = character.status
        statusLabel.backgroundColor = character.status == "Alive" ? .blue : .red
        charImage.layer.borderColor = character.status == "Alive" ? UIColor.blue.cgColor : UIColor.red.cgColor
        updateFocusIfNeeded()
    }
    
    private func configureImageFrom(url: String) {
        if let url = URL(string: url) {
                self.charImage.loadImageData(url)
        }
    }
    
}
