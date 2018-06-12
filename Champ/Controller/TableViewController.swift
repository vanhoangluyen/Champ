//
//  TableViewController.swift
//  Champ
//
//  Created by apple on 6/12/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataService.shared.getDataChamp { (champs) in
            DataService.shared.champs = champs
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DataService.shared.champs.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TableViewCell
        // Configure the cell...
        cell.photoImage.download(from: DataService.shared.champs[indexPath.row].url_Champ)
        cell.levelLabel.text = DataService.shared.champs[indexPath.row].level_Champ
        cell.nameENLabel.text = DataService.shared.champs[indexPath.row].nameEN_Champ
        cell.nameVILabel.text = DataService.shared.champs[indexPath.row].nameVN_Champ
        print(DataService.shared.champs[indexPath.row].level_Champ)
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (UIScreen.main.bounds.height / 10)
    }
}
