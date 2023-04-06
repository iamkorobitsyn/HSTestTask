//
//  MenuHeaderCollection.swift
//  HummerSystemsTestTask
//
//  Created by Александр Коробицын on 05.04.2023.
//


import UIKit

class TitleCollection: UIView {
    
    private let titles = ObjectData()
    private var selectedCell: IndexPath = [0, 0]
    var delegate: MenuViewController?
    
    //MARK: - UICollectionViewFlowLayout

    private let viewFrame = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
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

extension TitleCollection: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.arrayOfObjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCell",
                                                         for: indexPath) as? TitleCell {
            if indexPath.row == 0 {
                cell.backgroundColor = UIColor.red.withAlphaComponent(0.3)
            }
            cell.layer.borderWidth = 0.5
            cell.layer.borderColor = UIColor.red.withAlphaComponent(0.3).cgColor
            cell.layer.cornerRadius = 15
            cell.title.text = titles.arrayOfObjects[indexPath.row].title
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let updateSize = UILabel(frame: CGRect.zero)
        updateSize.text = titles.arrayOfObjects[indexPath.row].title
        updateSize.sizeToFit()
        return CGSize(width: updateSize.frame.width + 30, height: 30)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: selectedCell)?.backgroundColor = .none
        collectionView.cellForItem(at: indexPath)?.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        selectedCell = indexPath
        delegate?.update(index: indexPath.row)
    }
}

//MARK: - InstanceCollectionView

extension TitleCollection {
    
    private func instanceCollectionView() {
        viewFrame.addSubview(collectionView)
        collectionView.backgroundColor = .none
        collectionView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TitleCell.self, forCellWithReuseIdentifier: "TitleCell")
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
}
