//
//  Cell.swift
//  GithubApiApp
//
//  Created by Jonatan Eduardo de Araujo on 27/05/21.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet var repoName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(with repo: Repo) {
        print(repo.name)
        repoName.text = repo.name
    }

}
