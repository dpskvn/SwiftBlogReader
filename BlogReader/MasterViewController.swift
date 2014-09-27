//
//  MasterViewController.swift
//  BlogReader
//
//  Created by Dino Paskvan on 06/06/14.
//  Copyright (c) 2014 Dino Paskvan. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var blogPosts = [BlogPost]()


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blogURL = NSURL(string: "http://blog.teamtreehouse.com/api/get_recent_summary/")
        let jsonData = NSData(contentsOfURL: blogURL)
        
        var error: NSError?
        
        let dataDictionary = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &error) as NSDictionary
        
        let blogPostArray: Array<NSDictionary> = dataDictionary.objectForKey("posts") as Array
        
        for bpDictionary:NSDictionary in blogPostArray {
            var blogPost = BlogPost(title: bpDictionary["title"] as String)
            blogPost.author = bpDictionary["author"] as? String
            blogPost.thumbnail = bpDictionary["thumbnail"] as? String
            blogPost.date = bpDictionary["date"] as? String
            blogPost.url = NSURL(string: bpDictionary["url"] as String)
            blogPosts.append(blogPost)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // #pragma mark - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            let indexPath = self.tableView.indexPathForSelectedRow()
            let blogPost = blogPosts[indexPath!.row]
            (segue.destinationViewController as DetailViewController).blogPostUrl = blogPost.url!
            (segue.destinationViewController as DetailViewController).blogPostTitle = blogPost.title
        }
    }

    // #pragma mark - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blogPosts.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        let blogPost: BlogPost = blogPosts[indexPath.row]
        
        if let thumb = blogPost.thumbnail {
            let thumbURL = NSURL(string: thumb)
            let imageData = NSData(contentsOfURL: thumbURL)
            let image = UIImage(data: imageData)
            cell.imageView!.image = image
        } else {
            let image = UIImage(named: "treehouse.png")
            cell.imageView!.image = image
        }
        
        cell.textLabel!.text = blogPost.title
        cell.detailTextLabel!.text = "\(blogPost.author!) - \(blogPost.formattedDate())"
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

}

