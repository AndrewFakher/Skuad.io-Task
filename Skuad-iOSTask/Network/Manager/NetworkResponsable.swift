//
//  NetworkResponse.swift
//  NativeNetworkLayer
//
//  Created by Andrew on 4/14/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import Foundation

protocol NetworkResponsable {
    func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>
}
extension NetworkResponsable{
     func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
        case 200...299: return .success
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}

enum Result<String>{
    case success
    case failure(String)
}


