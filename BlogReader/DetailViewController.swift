//
//  DetailViewController.swift
//  BlogReader
//
//  Created by Dino Paskvan on 06/06/14.
//  Copyright (c) 2014 Dino Paskvan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var webView : UIWebView?
    
    var blogPostUrl:NSURL = NSURL()
    var blogPostTitle = ""

    func configureView() {
        // Update the user interface for the detail item.
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = blogPostTitle
        webView?.loadRequest(NSURLRequest(URL: blogPostUrl))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

