//
//  PersonCell.swift
//  MVP
//
//  Created by Dmitriy Eni on 24.09.2022.
//

import UIKit

class PersonCell: UITableViewCell {
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(person: Profile) {
        nameLabel.text = person.name
        statusLabel.text = "\(person.status) - \(person.type)"
        
        if let imageUrl = person.image {
            personImage.setImageFromURL(imageUrl)
        }
        personImage.image = UIImage(systemName: "camera.metering.unknown")!
        personImage.tintColor = UIColor.lightGray
    }
    
    override func prepareForReuse() {
        personImage.image = nil
    }
}
