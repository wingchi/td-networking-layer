//
//  LocalFetchService.swift
//  NetworkingLayer
//
//  Created by wingchi on 4/26/18.
//  Copyright © 2018 The Test and the Driven. All rights reserved.
//

import Foundation

struct LocalFetchService: Fetchable {
    func getArticle(completion: (FetchResponse) -> ()) {
        let resourceString = "image-response"
        guard let fileUrl = Bundle.main.url(forResource: resourceString, withExtension: "json") else {
            completion(.failure)
            return
        }
        let decoder = JSONDecoder()
        do {
            let jsonData = try Data(contentsOf: fileUrl)
            let article = try decoder.decode(Article.self, from: jsonData)
            completion(.articleSuccess(article))
        } catch {
            completion(.failure)
        }
    }
}
