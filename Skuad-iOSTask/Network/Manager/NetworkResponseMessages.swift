//
//  NetworkResponseMessages.swift
//  NativeNetworkLayer
//
//  Created by Andrew on 4/14/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import Foundation

enum NetworkResponse:String {
    case success
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

