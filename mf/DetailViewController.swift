//
//  DetailViewController.swift
//  mf
//
//  Created by Charles Konkol on 9/8/19.
//  Copyright © 2019 Charles Konkol. All rights reserved.
//

import UIKit
//1 Add import
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var WebSite: WKWebView!
    
    var weburl:String = ""
    
    func configureView() {
        
//2 Update the user interface for the detailitem.
        if weburl != "" {
//3 Comment out next 3 lines
//            if let label = detailDescriptionLabel {
//                label.text = detail.description
//            }

//4 Add next 16 likes of code.
            if let myWebview = WebSite {
                if let url = URL(string: weburl) {
                    let request = URLRequest(url: url)
                    myWebview.load(request)
                }
            }
        }else{
            //Defaul Home Page Loads when App first runs
            if let myWebview = WebSite {
                title = "Home"
                if let url = URL(string: "https://www.rockvalleycollege.edu") {
                    let request = URLRequest(url: url)
                    myWebview.load(request)
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

//4) Comment Out Next Three Lines
//    var detailItem: String? {
//        didSet {
//            // Update the view.
//            configureView()
//        }
//    }


}

