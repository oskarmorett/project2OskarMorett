//
//  MainViewController.swift
//  project 2.0
//
//  Created by oskar morett on 12/8/16.
//  Copyright © 2016 oskar morett. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
   
   var articles = [Article]()
   var currentArticle = Int ()
   
   @IBOutlet weak var TableView: UITableView!
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      print(articles)
      return articles.count
      
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      
      let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! MainTableViewCell
      let article = articles[indexPath.row]
      currentArticle = indexPath.row
      cell.updateUI(article: article)
      
      return cell
   }
   
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      newsApiData.fetchData { articleArray in
         print(articleArray)
         
         self.articles = articleArray
         
         DispatchQueue.main.async {
         self.TableView.reloadData()
         }
         
      }
      
   }// >> Overite Func
   
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      let detailVC = segue.destination as! DeteilsViewController
      detailVC.articleString = articles[currentArticle].url
      
   }
   
   
   
}// >> MainViewController

