//
//  ViewController.swift
//  File Upload
//
//  Created by Sijo Thadathil on 28/07/21.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var sendButtonImage: UIButton!
    @IBOutlet weak var myStackView: UIStackView!
    @IBOutlet weak var locationLabel: UILabel!
    
    var image = ["Image2","Image3","Image4","Image5","Image6","Image7","Image8"]
    override func viewDidLoad() {
        super.viewDidLoad()
        myImageView.layer.borderWidth = 0.1
        myImageView.layer.masksToBounds = false
        myImageView.layer.cornerRadius = myImageView.frame.height / 2
        myImageView.clipsToBounds = true
        myStackView.layer.cornerRadius = 16.0
        myStackView.layer.borderWidth = 1.0
        myStackView.layer.borderColor = UIColor.lightGray.cgColor
        locationLabel.layer.cornerRadius = 5.0
        locationLabel.layer.borderWidth = 1.0
        locationLabel.layer.borderColor = UIColor.systemBlue.cgColor
        let origImage = UIImage(named: "ButtonImage")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        sendButtonImage.setImage(tintedImage, for: .normal)
        sendButtonImage.tintColor = .systemBlue
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NewCollectionViewCell
        var imageIndex = image[indexPath.row]
       
            
            
        cell.cellImageView.image = UIImage(named: imageIndex)
        
        return cell
    }

}

