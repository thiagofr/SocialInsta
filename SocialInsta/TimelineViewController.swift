//
//  ViewController.swift
//  SocialInsta
//
//  Created by Thiago Franca Sousa on 16/05/21.
//

import UIKit

class TimelineViewController: UIViewController {

    @IBOutlet weak var timelineTableView: UITableView!

    var items: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timelineTableView.dataSource = self
        timelineTableView.delegate = self
    
        PostService.getPosts { (posts) in
            self.items = posts
            self.timelineTableView.reloadData()
        }
        
    }
}

extension TimelineViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemTableViewCell {
            
            let item = items[indexPath.row]
            
            PostService.getThumb { image in
                cell.pictureImageView?.image = image
                cell.userImageView?.image = image
                cell.userImageView?.layer.cornerRadius = 15
            }
            
            cell.titleLabel.text = item.body
            
            return cell
        }
        
        return UITableViewCell()
    }

}
