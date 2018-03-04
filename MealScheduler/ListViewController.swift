//
//  ListViewController.swift
//  MealScheduler
//
//  Created by 曽根大輔 on 2018/03/04.
//  Copyright © 2018年 曽根大輔. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController, XMLParserDelegate {
    
    var parser: XMLParser!
    var items = [Item]()
    var item: Item?
    var currentString = ""
    
    //表示するセルの数を設定
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
        
    }
    
    //表示するセルを作成
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].title
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startDownLoad()
    }
    
    //記事の読み込み
    func startDownLoad() {
        self.items = []
        if let url = URL(string: "https://oceans-nadia.com/feed/articles.rss"){
            if let parser = XMLParser(contentsOf: url) {
                self.parser = parser
                self.parser.delegate = self
                self.parser.parse()
            }
        }
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        self.currentString = ""
        if elementName == "item" {
            self.item = Item()
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        self.currentString += string
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        switch elementName {
        case "title": self.item?.title = currentString
        case "link": self.item?.link = currentString
        case "item": self.items.append(self.item!)
        default: break
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = self.tableView.indexPathForSelectedRow{
            let item = items[indexPath.row]
            let controller = segue.destination as! DetailViewController
            controller.title = item.title
            controller.link = item.link
        }
    }
}


