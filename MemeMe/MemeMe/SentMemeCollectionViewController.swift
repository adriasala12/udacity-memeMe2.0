//
//  SentMemeCollectionViewController.swift
//  MemeMe
//
//  Created by Adrià Sala Roget on 29/04/2020.
//  Copyright © 2020 Adrià Sala Roget. All rights reserved.
//

import UIKit

class SentMemeCollectionViewController: UICollectionViewController {

    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var memes = [Meme]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let spacing: CGFloat = 3
        let dimension = (view.frame.size.width - (2 * spacing)) / 3
        
        flowLayout.minimumInteritemSpacing = spacing
        flowLayout.minimumLineSpacing = spacing
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        self.collectionView.reloadData()
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        let stringForIndex = memes[(indexPath as NSIndexPath).row]
        
//        cell.cellLabel.text = stringForIndex.topTextField
        cell.cellImage.image = stringForIndex.memedImage
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = UIViewController()
        detailVC.view.addSubview(UIImageView(image: memes[(indexPath as NSIndexPath).row].memedImage))
        
        self.tabBarController?.tabBar.isHidden = true

        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @IBAction func addMeme(_ sender: Any) {
        let memeEditorVC = self.storyboard!.instantiateViewController(withIdentifier: "MemeEditorViewController")
        self.navigationController?.pushViewController(memeEditorVC, animated: true)
    }
    

}
