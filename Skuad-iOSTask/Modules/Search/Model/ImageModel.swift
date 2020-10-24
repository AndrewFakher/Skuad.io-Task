//
//  ImageModel.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import Foundation
struct ImageResponse: Codable {
    let total: Int?
    let hits: [Image]?
}

struct Image: Codable {
    let largeImageURL: String?
}
