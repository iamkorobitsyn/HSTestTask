//
//  Models.swift
//  HummerSystemsTestTask
//
//  Created by Александр Коробицын on 04.04.2023.
//

import Foundation

struct ViewModel: Decodable {
    let label: String
    let description: String
    let price: Int
    let imageURL: String
}
