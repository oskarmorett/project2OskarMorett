//
//  DeteilsViewController.swift
//  project 2.0
//
//  Created by oskar morett on 12/21/16.
//  Copyright © 2016 oskar morett. All rights reserved.
//

import UIKit

class DeteilsViewController: UIViewController {
   
   
   
   @IBOutlet weak var webView: UIWebView!
   
   var articleString: String!

    override func viewDidLoad() {
        super.viewDidLoad()
      
      let url = URL(string: articleString)
      let request = URLRequest(url: url!)
      print (url)
     // print(request)
      webView.loadRequest(request)
     
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
