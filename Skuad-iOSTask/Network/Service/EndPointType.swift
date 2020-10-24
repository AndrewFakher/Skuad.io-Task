//
//  EndPointType.swift
//  NativeNetworkLayer
//
//  Created by Andrew on 4/13/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get } //request body or request body with headers
    var headers: HTTPHeaders? { get }
}












