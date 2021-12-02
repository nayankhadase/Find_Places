//
//  NewsItemViewController.swift
//  map
//
//  Created by nayan.khadase on 01/12/21.
//  Copyright © 2021 nayan.khadase. All rights reserved.
//

import UIKit

class NewsItemViewController: UIViewController {
    var count = 0
    var newsItem: Articles?{
        didSet{
            DispatchQueue.main.async {
                self.count = 1
                self.tableView.reloadData()
            }
        }
    }
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }


}
extension NewsItemViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.newsItemCellIdentifier, for: indexPath) as! NewsItemTableViewCell
        cell.nesTitle.text = newsItem?.title
        cell.newsDesc.text = newsItem?.description
        cell.newsTime.text = newsItem?.publishedAt
        
        let url = URL(string: newsItem?.urlToImage ?? K.defaultImage)
        if let data = try? Data(contentsOf: url!){
            cell.newsImage.image = UIImage(data: data)
        }
        
        return cell
    }
    
    
}
