//
//  NetworkRouter.swift
//  NativeNetworkLayer
//
//  Created by Andrew on 4/13/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
