//
//  ViewController.swift
//  HammerSystemsTestTask
//
//  Created by Александр Коробицын on 03.04.2023.
//

import UIKit

protocol MenuViewControllerProtocol: AnyObject {
    func update(numberOfRows: Int,
                data: [ViewModel])
}

protocol MenuHeaderCollectionViewDelegate {
    func update(index: Int)
}

class MenuViewController: UIViewController {
    
    private let tableView = UITableView()
    private let cellID = "cellID"
    private let header = HeaderView()
    private let titleCollection = TitleCollection()
    private let headerCollection = HeaderCollection()
    
    private var numberOfRows: Int = 0
    private var data: [ViewModel] = []
    
    var links = ObjectData()
    var model: [ViewModel]?
    
    var presenter: MenuViewControllerPresenterProtocol? {
        didSet {
            presenter?.fetch(index: 0, completion: {
                self.tableView.reloadData()
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = MenuViewControllerPresenter(view: self)
        view.backgroundColor = UIColor.white
        titleCollection.delegate = self
        instanceTableView()
    }
    
    override func viewDidLayoutSubviews() {
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    //MARK: - InstanceTableView

    private func instanceTableView() {
        self.view.addSubview(tableView)
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.frame
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.blue.withAlphaComponent(0.03)
        tableView.tableHeaderView = headerCollection.collectionView
    }
    
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return titleCollection.collectionView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? MenuTableViewCell {
            cell.selectionStyle = .none
            cell.image.fetchImage(from: data[indexPath.row].imageURL, cash: true) {}
            cell.labelText.text = data[indexPath.row].label
            cell.descriptionLabel.text = data[indexPath.row].description
            cell.priceLabel.text = String(data[indexPath.row].price)
            return cell
        }
        return UITableViewCell()
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }
}

//MARK: - getIndex&ReloadData

extension MenuViewController: MenuHeaderCollectionViewDelegate {
    func update(index: Int) {
        
        self.presenter?.fetch(index: index, completion: {
            self.tableView.reloadData()
        })
    }
}

//MARK: - getData&ReloadData

extension MenuViewController: MenuViewControllerProtocol {
    func update(numberOfRows: Int, data: [ViewModel]) {
        self.numberOfRows = numberOfRows
        self.data = data
    }
}

