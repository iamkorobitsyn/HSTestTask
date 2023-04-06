//
//  MenuTableViewCell.swift
//  HammerSystemsTestTask
//
//  Created by Александр Коробицын on 03.04.2023.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
//MARK: - SetViews
    
    var image: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.backgroundColor = UIColor.yellow
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var textView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let priceStickerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.cornerRadius = 5
        return view
    }()
    
    var labelText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Label of object"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = UIColor.darkGray
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Description & ingridients here Description & ingridients here Description & ingridients here"
        label.textAlignment = .left
        label.numberOfLines = 4
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = UIColor.gray
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "price"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.textColor = UIColor.red
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setConstraints()
    }
    
//MARK: - SetConstraints
    
    private func setConstraints() {
        contentView.addSubview(image)
        contentView.addSubview(textView)
        textView.addSubview(priceStickerView)
        textView.addSubview(labelText)
        textView.addSubview(descriptionLabel)
        priceStickerView.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 150),
            image.widthAnchor.constraint(equalToConstant: 150),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            textView.heightAnchor.constraint(equalToConstant: 150),
            textView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            textView.leadingAnchor.constraint(equalTo: image.trailingAnchor),
            textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            priceStickerView.heightAnchor.constraint(equalToConstant: 30),
            priceStickerView.widthAnchor.constraint(equalToConstant: 80),
            priceStickerView.trailingAnchor.constraint(equalTo: textView.trailingAnchor),
            priceStickerView.bottomAnchor.constraint(equalTo: textView.bottomAnchor),
            
            labelText.centerXAnchor.constraint(equalTo: textView.centerXAnchor),
            labelText.topAnchor.constraint(equalTo: textView.topAnchor, constant: 10),
            labelText.widthAnchor.constraint(equalTo: textView.widthAnchor, constant: -50),
            
            descriptionLabel.centerYAnchor.constraint(equalTo: textView.centerYAnchor),
            descriptionLabel.centerXAnchor.constraint(equalTo: textView.centerXAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: textView.widthAnchor, constant: -50),
            
            priceLabel.centerXAnchor.constraint(equalTo: priceStickerView.centerXAnchor),
            priceLabel.centerYAnchor.constraint(equalTo: priceStickerView.centerYAnchor)

        ])
        
    }

}
