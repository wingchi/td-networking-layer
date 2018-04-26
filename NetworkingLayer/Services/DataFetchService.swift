//
//  DataFetchService.swift
//  NetworkingLayer
//
//  Created by wingchi on 4/26/18.
//  Copyright © 2018 The Test and the Driven. All rights reserved.
//

import Foundation

struct DataFetchService: Fetchable {
    func getArticle(completion: (FetchResponse) -> ()) {
        // TODO: Make actual network calls
        completion(.failure)
    }
}
