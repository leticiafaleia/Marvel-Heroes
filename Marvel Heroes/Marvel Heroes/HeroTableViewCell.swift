//
//  HeroTableViewCell.swift
//  Marvel Heroes
//
//  Created by Letícia on 06/11/20.
//

import UIKit
import Kingfisher

class HeroTableViewCell: UITableViewCell {
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroAbout: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepareCell(with hero: Hero){
        heroName.text = hero.name
        heroAbout.text = hero.about
        if let imageUrl = URL(string: hero.thumbnail.url) {
            heroImage.kf.indicatorType = .activity
            heroImage.kf.setImage(with: imageUrl)
        } else {
            heroImage.image = nil
        }
        heroImage.layer.cornerRadius = heroImage.frame.size.height/2
        heroImage.layer.borderColor = UIColor.red.cgColor
        heroImage.layer.borderWidth = 2
    }

}
