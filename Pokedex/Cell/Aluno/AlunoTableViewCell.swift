//
//  AlunoTableViewCell.swift
//  Pokedex
//
//  Created by Guilherme Berson on 28/04/21.
//

import UIKit

class AlunoTableViewCell: UITableViewCell {

    @IBOutlet var nome: UILabel!
    @IBOutlet var tel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
