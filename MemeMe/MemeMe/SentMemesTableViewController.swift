//
//  SentMemesTableViewController.swift
//  MemeMe
//
//  Created by Adrià Sala Roget on 28/04/2020.
//  Copyright © 2020 Adrià Sala Roget. All rights reserved.
//

import UIKit

class SentMemesTableViewController: UITableViewController {

    var memes = [Meme]()
    
//    var memes = ["a", "b", "c"]

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        self.tableView.reloadData()
        self.tabBarController?.tabBar.isHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    @IBAction func addMeme(_ sender: Any) {
        let memeEditorVC = self.storyboard!.instantiateViewController(withIdentifier: "MemeEditorViewController")
        self.navigationController!.pushViewController(memeEditorVC, animated: true)
    }
    // MARK: - Table view data source
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return self.memes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell")!
        let memeForRow = self.memes[(indexPath as NSIndexPath).row]
        
        cell.textLabel?.text = memeForRow.topTextField
        cell.detailTextLabel?.text = memeForRow.bottomTextField
        cell.imageView?.image = memeForRow.memedImage
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = UIViewController()
        detailVC.view.addSubview(UIImageView(image: memes[(indexPath as NSIndexPath).row].memedImage))
        
        self.tabBarController?.tabBar.isHidden = true
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }

    
 

}
