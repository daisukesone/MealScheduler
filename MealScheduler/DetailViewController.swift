//
//  DetailViewController.swift
//  MealScheduler
//
//  Created by 曽根大輔 on 2018/03/04.
//  Copyright © 2018年 曽根大輔. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController : UIViewController  {
    
    @IBOutlet weak var webView: WKWebView!
    
    var link: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: self.link) {
            let request = URLRequest(url: url)
            self.webView.load(request)
        }
    }
}
