//
//  TableViewCell.swift
//  Pokedex
//
//  Created by Guilherme Berson on 23/04/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var name: UILabel!
    @IBOutlet var photo: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
