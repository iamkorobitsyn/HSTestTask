//
//  DataBase.swift
//  HummerSystemsTestTask
//
//  Created by Александр Коробицын on 04.04.2023.
//

import Foundation
import UIKit

struct ObjectData {
    
    struct Object {
        let title: String
        let url: String
    }
    
    let arrayOfObjects: [Object] = [
        Object(title: "Пицца",
               url: "https://virtserver.swaggerhub.com/iamkorobitsyn/korobitsyn/1.0.0/getPizza"),
        Object(title: "Салаты",
               url: "https://virtserver.swaggerhub.com/iamkorobitsyn/korobitsyn/1.0.0/getSalads"),
        Object(title: "Лимонады",
               url: "https://virtserver.swaggerhub.com/iamkorobitsyn/korobitsyn/1.0.0/getLimonades"),
        Object(title: "Молочные коктейли",
               url: "https://virtserver.swaggerhub.com/iamkorobitsyn/korobitsyn/1.0.0/getMilkshakes")
    ]
    
    struct ImagesForHeader {
        let firstImage = UIImage(named: "1")
        let secondImage = UIImage(named: "2")
        let thirdImage = UIImage(named: "3")
    }

}
