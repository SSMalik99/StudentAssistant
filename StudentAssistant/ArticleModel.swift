//
//  ArticleModel.swift
//  StudentAssistant
//
//  Created by Saravjeet Singh on 2022-12-08.
//

import Foundation

class ArticleModel {
    let BASE_URL =  "https://inshorts.deta.dev/news?category=science"
    
    func GetScienceArticles(_ tableViewController: NewsTableViewController) {
        
        guard let url = URL(string: BASE_URL) else{
            return
        }


        let articles = URLSession.shared.dataTask(with: url){
            data, response, error in
            
            if let dataRecieved = data {
//                _ = String(data: dataRecieved, encoding: .utf8)
                do {
                    let json = try JSON(data: dataRecieved)
//                    let mainArticles = json["data"]
                    tableViewController.insertArticles(articles: json)
                    
                    
                }catch let err {
                    print("failed to parse data\(err)")
                }
            }
            
        }

        articles.resume()
    }
}



struct Article {
//    var author:String
    var content: String
//    let date : String
//    let id : String
    var imageUrl: String
    let readMoreUrl: String
//    let time: String
    var title:String
//    let url: String
    
    init(newImageUrl:String, newTitle: String, newContent: String, newReadMoreUrl: String) throws {
        imageUrl = newImageUrl
        title = newTitle
        content = newContent
        readMoreUrl = newReadMoreUrl
    
    }
    
}

struct ApiData:Codable{
    let category: String
    let data: [[String: String]]
    let Success: Bool
    
}
