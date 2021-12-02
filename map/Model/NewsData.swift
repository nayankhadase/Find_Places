//
//  NewsData.swift
//  map
//
//  Created by nayan.khadase on 01/12/21.
//  Copyright © 2021 nayan.khadase. All rights reserved.
//

import Foundation
struct NewsData: Codable {
    var articles: [Articles]
}

struct Articles: Codable {
    let title: String
    let description: String?
    let urlToImage: String?
    let publishedAt: String?
    
}
