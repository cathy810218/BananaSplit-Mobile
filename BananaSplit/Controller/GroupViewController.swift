//
//  GroupViewController.swift
//  BananaSplit
//
//  Created by Cathy Oun on 3/24/18.
//  Copyright © 2018 Cathy Oun. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let reuseIdentifier = "cell"
    var items = ["Friends", "Family", "Roommate"]
    var currentSelectedGroup: IndexPath?
    

    
    @IBOutlet weak var name: UITextField!
    @IBAction func addGroup(_ sender: Any) {
        let newName = name.text!
        if newName == "" || newName == "Add a Group Name" {
            
        }
        else{
            items.append(newName)
            collectionVIew.reloadData()
        }
        
        
    }
    @IBOutlet weak var collectionVIew: UICollectionView!
    
    @IBAction func signoutAction(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "access_token")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! controllerViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.label.text = self.items[indexPath.item]
        
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let cell = sender as? UICollectionViewCell,
            let indexPath = self.collectionVIew.indexPath(for: cell) {
            
            let vc = segue.destination as! individualGroupViewController //Cast with your DestinationController
            //Now simply set the title property of vc
            vc.label1 = items[indexPath.row] as String
        }
    }

    @IBAction func deleteGroup(_ sender: UIButton) {
        if let cell = sender.superview?.superview as? UICollectionViewCell{
            let indexPath = collectionVIew.indexPath(for: cell)
            items.remove(at: (indexPath?.row)!)
            collectionVIew.reloadData()
        }
//        let cell = sender as? UICollectionViewCell
    //    let indexPath = self.collectionVIew.indexPath(for: cell!)
       
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        name.clearsOnBeginEditing = true
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = UIColor.brown
        let img = UIImage()
        navigationController?.navigationBar.shadowImage = img
        self.navigationController?.navigationBar.setBackgroundImage(img, for: UIBarMetrics.default)
        
        
        let imageView = UIImageView(image: UIImage(named: "logo"))
        let imageSize = CGSize(width: 80, height: 50)
        let marginX = ((self.navigationController?.navigationBar.frame.size.width)! / 2) - (imageSize.width / 2);
        imageView.frame = CGRect(x: marginX, y: 0, width: imageSize.width, height: imageSize.height)
        self.navigationController?.navigationBar.addSubview(imageView)
    }

    
    

}
