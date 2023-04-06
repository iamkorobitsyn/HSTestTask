//
//  MenuViewControllerPresenter.swift
//  HummerSystemsTestTask
//
//  Created by Александр Коробицын on 06.04.2023.
//

import Foundation

protocol MenuViewControllerPresenterProtocol {
    init(view: MenuViewController)
    func fetch(index: Int, completion: @escaping() -> Void)
}

class MenuViewControllerPresenter: MenuViewControllerPresenterProtocol {
    
    
    var links = ObjectData()
    
    var data: [ViewModel] = []
    
    unowned let view: MenuViewController
    
    required init(view: MenuViewController) {
        self.view = view
    }
    
       func fetch(index: Int, completion: @escaping () -> Void) {
        NetworkManager.shared.fetchJSON(url: links.arrayOfObjects[index].url) { result in
            switch result {
                
            case .success(let data):
                self.data = data
                self.view.update(numberOfRows: self.data.count, data: self.data)
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}
