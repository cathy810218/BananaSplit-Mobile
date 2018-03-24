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
    
    @IBOutlet weak var name: UITextField!
    @IBAction func addGroup(_ sender: Any) {
        let newName = name.text!
        if newName != ""{
            items.append(newName)
            collectionVIew.reloadData()
        }
        
        
    }
    @IBOutlet weak var collectionVIew: UICollectionView!
    

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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    

}
