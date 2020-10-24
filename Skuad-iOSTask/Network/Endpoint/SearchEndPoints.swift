//
//  SearchEndPoints.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import Foundation

public enum SearchApi {
    case search(query:String)
    case loadMoreImages(query:String,page:Int)
}

extension SearchApi: EndPointType {
    
    var BaseURL : String {
         return "https://pixabay.com/"
    }
    
    var baseURL: URL {
        guard let url = URL(string: BaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .search, .loadMoreImages:
            return "api/"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .search, .loadMoreImages:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .search(let query):
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["q": query,
                                                      "key":SearchInteractor.pixabayAPIKey])
        case .loadMoreImages(let query, let page):
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["q": query,
                                                      "page": page,
                                                      "key":SearchInteractor.pixabayAPIKey])
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
