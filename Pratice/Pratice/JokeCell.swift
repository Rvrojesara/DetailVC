//
//  JokeCell.swift
//  Pratice
//
//  Created by admin on 05/10/24.
//

import UIKit

class JokeCell: UITableViewCell {

    @IBOutlet weak var idlable: UILabel!
    @IBOutlet weak var punchlinelabel: UILabel!
    @IBOutlet weak var typelabel: UILabel!
    @IBOutlet weak var setuplabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
