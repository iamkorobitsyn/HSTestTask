//
//  ContactsViewController.swift
//  HammerSystemsTestTask
//
//  Created by Александр Коробицын on 03.04.2023.
//

import UIKit

class ContactsViewController: UIViewController {
    
    let screen: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "EmptyScreen")
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(screen)
        view.backgroundColor = UIColor.white
        
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: view.topAnchor),
            screen.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            screen.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

    }

}
