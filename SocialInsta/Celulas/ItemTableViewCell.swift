//
//  ItemTableViewCell.swift
//  SocialInsta
//
//  Created by Thiago Franca Sousa on 16/05/21.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var pictureImageView: UIImageView!

    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func prepareForReuse() {
        pictureImageView.image = UIImage()
    }
    
}
