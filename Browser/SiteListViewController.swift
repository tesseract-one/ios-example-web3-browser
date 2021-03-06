//
//  SiteListViewController.swift
//  Browser
//
//  Created by Yehor Popovych on 10/25/18.
//  Copyright © 2018 Tesseract Systems, Inc. All rights reserved.
//

import UIKit

private let networkNames: Dictionary<UInt64, String> = [
    1: "Mainnet",
    2: "Ropsten",
    3: "Kovan",
    4: "Rinkeby"
]

private let applications: Array<(URL?, UInt64)> = [
    (URL(string:"https://www.cryptokitties.co"), 1),
    //(URL(string:"https://blockchaincuties.co/"), "1")
    //(URL(string:"https://0xuniverse.com"), "1")
    //(URL(string:"https://chickenhunt.io"), "1")
    //(URL(string:"https://www.etheremon.com/"), "1")
    //(URL(string:"https://www.mycryptoheroes.net/"), "1")
    //(URL(string:"https://godsunchained.com/"), "1")
    (URL(string:"http://crypto-rose.com"), 4),
    (URL(string:"https://grafiti.online"), 4),
    (URL(string:"http://staticoin.com/dapp/"), 4),
    (URL(string: "https://beta.cent.co"), 4),
    (URL(string: "https://etheroll.com"), 4),
    (URL(string: "https://sharits.netlify.com/"), 4)
    //(URL(string:"https://demo.originprotocol.com/"), "4")
]

class SiteListViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = true

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
        return applications.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SiteCell", for: indexPath)

        // Configure the cell...
        let app = applications[indexPath.row]
        cell.textLabel?.text = app.0?.host
        
        cell.detailTextLabel?.text = networkNames[app.1]

        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let vc = segue.destination as! ViewController
        let row = tableView.indexPathForSelectedRow!.row
        vc.appUrl = applications[row].0
        vc.netVersion = applications[row].1
    }
    

}
