//
//  NewsTableViewController.swift
//  StudentAssistant
//
//  Created by Saravjeet Singh on 2022-12-08.
//

import UIKit

class NewsTableViewController: UITableViewController {

    var articleModel = ArticleModel()
    var mainArticles = [Article].self()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        articleModel.GetScienceArticles(self)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mainArticles.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Set the row height based on whether or not the Int associated with that row is contained in the expandedCells array
        return 150
    }

    func insertArticles(articles: JSON) {
        
        do{
            
            try articles["data"].forEach { (index, json) in
                let imageUrl = json["imageUrl"].stringValue
                let title = json["title"].stringValue
                let content = json["content"].stringValue
                let readMoreUrl = json["readMoreUrl"].stringValue
                let newArticle = try Article(newImageUrl:imageUrl, newTitle: title, newContent: content, newReadMoreUrl : readMoreUrl)
                
                mainArticles.append(newArticle)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                
            }
        }catch {
            print("error occured")
        }
        
            
       
        
            
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsArticleCell", for: indexPath) as! NewsTableViewCell

        // Configure the cell...
        cell.articleTitle.text = mainArticles[indexPath.row].title
        cell.articleImage.loadFrom(URLAddress: mainArticles[indexPath.row].imageUrl)
        
        cell.readMoreUrl = mainArticles[indexPath.row].readMoreUrl
//
//        cell.articleDescription.text = mainArticles[indexPath.row].content
        return cell
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        loadData()
//        tableView.reloadData()
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: mainArticles[indexPath.row].readMoreUrl) else { return }
//        let request = URLRequest(url: url)
        print(url)
        
        // trying to implement but taking time... will do after
        
//        UIWebView().loadRequest(URLRequest(URL(mainArticles[indexPath.row].readMoreUrl)))
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}
