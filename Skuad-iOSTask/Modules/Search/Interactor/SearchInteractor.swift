//
//  SearchInteractor.swift
//  Skuad-iOSTask
//
//  Created by Andrew on 10/24/20.
//  Copyright © 2020 Andrew. All rights reserved.
//
import Foundation

//MARK: Search Requests Api's

class SearchInteractor: NetworkResponsable {
    static let pixabayAPIKey = Keys.apiKey
    let router = Router<SearchApi>()
    
    func searchMovie(query: String, completion: @escaping (_ images: [Image]? ,_ total: Int?,_ error: String?)->()){
        router.request(.search(query: query)) { data, response, error in
            if error != nil {
                completion(nil, nil,"Please check your network connection.")
            }
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(ImageResponse.self, from: responseData)
                        completion(apiResponse.hits,apiResponse.total ,nil)
                    }catch {
                        print(error)
                        completion(nil,nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil,nil, networkFailureError)
                    
                }
            }
        }
    }
    
    func loadMoreImages(query: String,page:Int, completion: @escaping (_ movie: [Image]?,_ error: String?)->()){
        router.request(.loadMoreImages(query: query, page: page)) { data, response, error in
            if error != nil {
                completion(nil,"Please check your network connection.")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(ImageResponse.self, from: responseData)
                        completion(apiResponse.hits,nil)
                    }catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                    
                }
            }
        }
    }

}
