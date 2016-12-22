//
//  MainTableViewCell.swift
//  project 2.0
//
//  Created by oskar morett on 12/8/16.
//  Copyright © 2016 oskar morett. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
   
   var article: Article!
   
   @IBOutlet weak var tcImageView: UIImageView!
   
   @IBOutlet weak var titleLavel: UILabel!
   
   @IBOutlet weak var descriptionLavel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
   
   func updateUI(article: Article) {
      
      self.article = article
      titleLavel.text = article.title
      descriptionLavel.text = article.description
   
      
   fecthImage()

   }

   
   
   func fecthImage() {
      let url = URL(string: article.urlToImage)!
      
      let request = NSMutableURLRequest(url: url)
      let task = URLSession.shared.dataTask(with: request as URLRequest) {
         data, response, error in
         
         if error != nil {
            
            print(error.debugDescription)
            
         } else {
            
            if let data = data {
               
               if UIImage(data: data) != nil {
                  DispatchQueue.main.async {
                        self.tcImageView.image = UIImage(data: data)
               }
               
               }
               
            }
            
         }
         
      }
      task.resume()

   }
   

   
}// >> TableViewCEll
