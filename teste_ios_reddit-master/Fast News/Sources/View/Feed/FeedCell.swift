//
//  FeedCell.swift
//  Fast News
//
//  Copyright © 2019 Lucas Moreton. All rights reserved.
//

import UIKit


@IBDesignable
class FeedCell: UITableViewCell, UIImagePickerControllerDelegate {
    
    //MARK: - Properties
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
  //  @IBAction func testebutton(_ sender: UIButton) {
//        var bolinho: HotNewsViewModel?
//
//        bolinho?.url
//        print(bolinho?.url)
        
//        guard let image = thumbnailImageView.image else { return }
//            let activityController =
//           UIActivityViewController(activityItems: [image],
//              applicationActivities: nil)
//            activityController.popoverPresentationController?.sourceView =
//               sender
//            present(activityController, animated: true, completion: nil)
        
  //  }
    
//    var bolinho: HotNewsViewModel?
//    var cell: FeedCell?
//
//    func teste () {
//        cell?.shareButton.addTarget(self, action:  Selector(("click:")), for: .touchUpInside)
//    //    cell.share.addTarget( UIButton.self, action: Selector(("click:")), for: .touchUpInside)
//    }
//
//    func click(sender: UIButton) {
//        print("click")
//    }
//
    
    //MARK: - Public Methods
    
    func setup(hotNewsViewModel: HotNewsViewModel) {
        authorLabel.text = hotNewsViewModel.author
        createdAtLabel.text = hotNewsViewModel.createdAt
        thumbnailImageView.image = hotNewsViewModel.image
        titleLabel.text = hotNewsViewModel.title
        commentsLabel.text = hotNewsViewModel.comments
        scoreLabel.text = hotNewsViewModel.score
    }
    
    func setup(viewModel: TypeProtocol) {
        guard let hotNewsViewModel = viewModel as? HotNewsViewModel else { return }
        authorLabel.text = hotNewsViewModel.author
        createdAtLabel.text = hotNewsViewModel.createdAt
        thumbnailImageView.image = hotNewsViewModel.image
        titleLabel.text = hotNewsViewModel.title
        commentsLabel.text = hotNewsViewModel.comments
        scoreLabel.text = hotNewsViewModel.score
        //shareButton = hotNewsViewModel.share //
    }
    
}
