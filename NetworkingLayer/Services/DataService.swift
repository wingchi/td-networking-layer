//
//  DataService.swift
//  NetworkingLayer
//
//  Created by wingchi on 4/26/18.
//  Copyright © 2018 The Test and the Driven. All rights reserved.
//

import Foundation

protocol Fetchable {
    func getArticle(completion: (FetchResponse)->())
}

enum FetchResponse {
    case articleSuccess(Article)
    // TODO: This failure should pass an error through associated values
    case failure
}

struct DataService {
    let useLocalData: Bool
    
    init(useLocalData: Bool = false) {
        self.useLocalData = useLocalData
    }
    
    func getArticle(completion: (Article)->()) {
        let fetchService: Fetchable = useLocalData ? LocalFetchService() : DataFetchService()
        fetchService.getArticle { response in
            switch response {
            case .articleSuccess(let article):
                completion(article)
            case .failure:
                // TODO: Do something with the failure
                return
            }
        }
    }
}
