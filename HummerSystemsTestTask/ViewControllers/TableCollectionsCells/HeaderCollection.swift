//
//  HeaderCollection.swift
//  HummerSystemsTestTask
//
//  Created by Александр Коробицын on 05.04.2023.
//

import UIKit

class HeaderCollection: UIView {
    
    let images = ObjectData.ImagesForHeader()
    
    
    //MARK: - UICollectionViewFlowLayout
    
    private let viewFrame = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150))
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: 300, height: 150)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        instanceCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - DelegateSourceLayout

extension HeaderCollection: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let images = [images.firstImage, images.secondImage, images.thirdImage]
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell",
                                                         for: indexPath) as? HeaderCell {
            let images = [images.firstImage, images.secondImage, images.thirdImage]
            cell.image.image = images[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
}


//MARK: - InstanceCollectionView

extension HeaderCollection {
    
    private func instanceCollectionView() {
        viewFrame.addSubview(collectionView)
        collectionView.backgroundColor = .none
        collectionView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HeaderCell.self, forCellWithReuseIdentifier: "HeaderCell")
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
}
