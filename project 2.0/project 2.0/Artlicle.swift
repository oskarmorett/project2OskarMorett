//
//  Artlicle.swift
//  project 2.0
//
//  Created by oskar morett on 12/8/16.
//  Copyright © 2016 oskar morett. All rights reserved.
//

import Foundation
import UIKit

var articles = [Article]()


class Article {
   
   static let shared = Article()
   
   private init() {}

   
   var description: String = ""
   var title: String = ""
   var url: String = ""
   var urlToImage: String = ""
        
   init(jsonOject: [String: Any]) {
      
      self.description = jsonOject["description"] as? String ?? "unknows"
      self.title = jsonOject["title"] as? String ?? "unknows"
      self.url = jsonOject["url"] as? String ?? "unknown"
      self.urlToImage = jsonOject["urlToImage"] as? String ?? "unknown"
      
      
   }
}// end of Artlicles







