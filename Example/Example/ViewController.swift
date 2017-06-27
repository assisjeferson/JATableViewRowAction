//
//  ViewController.swift
//  JATableViewRowAction
//
//  Created by assisjeferson on 06/26/2017.
//  Copyright (c) 2017 assisjeferson. All rights reserved.
//

import UIKit
import JATableViewRowAction

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = "Cell \(indexPath.row)"
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let rowHeight = Int(tableView.rowHeight)
        
        let edit = JATableViewRowAction.rowAction(style: .normal, title: "Edit", titleColor: .white, image: UIImage(named: "add_icon")!, backgroundColor: UIColor.green, frame: CGSize(width: 50, height: rowHeight), font: nil) { (action, indexPath) in
            
        }
        
        let addAllotment = JATableViewRowAction.rowAction(style: .normal, title: "More", titleColor: .white, image: UIImage(named: "add_icon")!, backgroundColor: UIColor.lightGray, frame: CGSize(width: 0, height: rowHeight), font: nil) { (action, indexPath) in
            
        }
        
        let delete = JATableViewRowAction.rowAction(style: .normal, title: "", titleColor: .white, image: UIImage(named: "add_icon")!, backgroundColor: UIColor.red, frame: CGSize(width: 50, height: rowHeight), font: nil) { (action, indexPath) in
            
        }
        
        return [edit, addAllotment, delete]
    }
}

