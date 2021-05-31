//
//  FeedDetailsViewController.swift
//  Fast News
//
//  Copyright © 2019 Lucas Moreton. All rights reserved.
//

import UIKit

class FeedDetailsViewController: UIViewController {
    
    //MARK: - Properties
    
    var hotNewsViewModel: HotNewsViewModel?
        
    var comments: [Comment] = [Comment]() {
        didSet {
            var viewModels: [TypeProtocol] = [TypeProtocol]()
            
            if let hotNews = hotNewsViewModel {
                viewModels.append(hotNews)
            }
            
            _ = comments.map { (comment) in
                viewModels.append(CommentViewModel(comment: comment))
            }
            
            self.mainView.setup(with: viewModels, and: self)
        }
    }
    
    var button: HotNewsViewModel?
    
    
    
    func teste () {
      //  print(hotNewsViewModel?.url)
       // print(hotNewsViewModel?.share.addTarget(self, action: "click", for: .touchUpInside))
        
         hotNewsViewModel?.url ?? "teste"
    }
    
    func click(sender: UIButton) {
           print(hotNewsViewModel?.url)
    
    }
   
      //  bolinho?.share.addTarget(self, action: "click", for: .touchUpInside)
    
    
    
    var mainView: FeedDetailsView {
        guard let view = self.view as? FeedDetailsView else {
            fatalError("View is not of type FeedDetailsView!")
        }
        return view
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teste()
        navigationItem.largeTitleDisplayMode = .never
        
        HotNewsProvider.shared.hotNewsComments(id: hotNewsViewModel?.id ?? "") { (completion) in
            do {
                let comments = try completion()
                
                self.comments = comments
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

extension FeedDetailsViewController: FeedViewDelegate {
    func didTouch(cell: FeedCell, indexPath: IndexPath) {
        guard self.mainView.viewModels[indexPath.row].type == .hotNews,
            let viewModel = self.mainView.viewModels[indexPath.row] as? HotNewsViewModel else {
                return
        }
        
        if let url = URL(string: viewModel.url) {
            UIApplication.shared.open(url)
        }
    }
}
