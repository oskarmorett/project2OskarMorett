//
//  newsApiData.swift
//  project 2.0
//
//  Created by oskar morett on 12/8/16.
//  Copyright © 2016 oskar morett. All rights reserved.
//

import Foundation
import UIKit




class newsApiData {
   
static func fetchData(closure: @escaping ([Article]) -> ()) {
   
   let endpoint = "https://newsapi.org/v1/articles?source=techcrunch&sortBy=latest&apiKey=fee72f8560f0444f9ab445ab41778666"
   let url = URLRequest(url: URL(string: endpoint as String)!)
   let session = URLSession(configuration: URLSessionConfiguration.default)
   let task = session.dataTask(with: url) { (data, response, error) in
      guard let responseData = data else {
         print("Error: did not receive data")
         return
      }
      do {
         
         let jsonResult = try JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: Any]
         let articles = jsonResult["articles"] as! [[String: Any]]
         
         DispatchQueue.main.async {
            var articleArray = [Article]()
            for  articleDAta in articles {
               articleArray.append(Article(jsonOject: articleDAta))
            }
            
            closure(articleArray)
         }
         
      } catch {
         
         print("Failed")
         
      }
   }
   task.resume()
}// >> static Func Fetchdata
   
   
} // >> news API DATA





