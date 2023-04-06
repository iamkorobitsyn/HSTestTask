//
//  HeaderCell.swift
//  HummerSystemsTestTask
//
//  Created by Александр Коробицын on 05.04.2023.
//

import UIKit

class HeaderCell: UICollectionViewCell {
    
    let image: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        instanceConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderCell {
    private func instanceConstraints() {
        
        contentView.addSubview(image)
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.widthAnchor.constraint(equalToConstant: contentView.frame.width),
            image.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
