//
//  NewsParsing.swift
//  map
//
//  Created by nayan.khadase on 01/12/21.
//  Copyright © 2021 nayan.khadase. All rights reserved.
//

import Foundation
protocol NewsParsingDelegate {
    func didUpdateNews(newsItems: NewsData)
}

struct NewsParsing {
    var delegate: NewsParsingDelegate?
    // for all search VC
    func searchForAllNews(for category: String){
        // "https://newsapi.org/v2/top-headlines?category=\(category)&country=in&apiKey=7f8c5a29220740d6b597f9860ce7e240"
        let urlString = "\(K.baseUrl)top-headlines?category=\(category)&country=\(K.country)&apiKey=\(K.newsApiKey)"
        getNewsData(for: urlString)
    }
    
    // for search VC
    func SearchForQuery(for query: String){
        // "https://newsapi.org/v2/top-headlines?q=\(query)&country=in&apiKey=7f8c5a29220740d6b597f9860ce7e240"
        let urlString = "\(K.baseUrl)top-headlines?q=\(query)&country=\(K.country)&apiKey=\(K.newsApiKey)"
        getNewsData(for: urlString)
    }
    
    private func getNewsData(for stringURL: String){
        
        //let baseURL = stringURL
        if let url = URL(string: stringURL){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("error in geting data \(error!)")
                    return
                }
                if let safeData = data{
                    if let news = self.parseJSON(with: safeData){
                        //print(news.articles)
                        self.delegate?.didUpdateNews(newsItems: news)
                    }
                }
            }
            task.resume()
        }
    }
    
    
    private func parseJSON(with newsData: Data) -> NewsData?{
        
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(NewsData.self, from: newsData)
            return decodedData
            
        }catch{
            print("errors while decoding \(error)")
            return nil
        }
        
    }
    
    
    
}
