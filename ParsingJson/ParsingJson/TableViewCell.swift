//
//  TableViewCell.swift
//  ParsingJson
//
//  Created by Carlos Alberto Savi on 09/03/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageUrl: UIImageView!
    @IBOutlet weak var labelFullName: UILabel!
    @IBOutlet weak var labelFamily: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
