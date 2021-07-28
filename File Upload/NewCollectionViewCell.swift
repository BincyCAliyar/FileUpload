//
//  NewCollectionViewCell.swift
//  File Upload
//
//  Created by Sijo Thadathil on 28/07/21.
//

import UIKit

class NewCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
      
        
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        cellImageView.layer.borderWidth = 0.1
        cellImageView.layer.masksToBounds = false
        cellImageView.layer.cornerRadius = cellImageView.frame.height / 2
        cellImageView.clipsToBounds = true
    }
    
    
}
