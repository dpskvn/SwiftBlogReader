//
//  BlogPost.swift
//  BlogReader
//
//  Created by Dino Paskvan on 06/06/14.
//  Copyright (c) 2014 Dino Paskvan. All rights reserved.
//

import UIKit

class BlogPost: NSObject {
    var title: String
    var author: String?
    var thumbnail: String?
    var date: String?
    var url: NSURL?
    
    init(title: String) {
        self.title = title
        super.init()
    }
    
    func formattedDate() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let tempDate = dateFormatter.dateFromString(date!)
        dateFormatter.dateFormat = "EE MMM, dd"
        return dateFormatter.stringFromDate(tempDate!)
    }
}
