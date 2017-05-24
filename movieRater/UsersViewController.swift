//
//  UsersViewController.swift
//  movieRater
//
//  Created by Dylan Sharkey on 5/22/17.
//  Copyright © 2017 Dylan Sharkey. All rights reserved.
//

import UIKit
import Firebase


class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    var ref: FIRDatabaseReference!
    var users: [NSDictionary]?
    
    @IBOutlet weak var tableVIew: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userID = FIRAuth.auth()?.currentUser?.uid
        ref = FIRDatabase.database().reference()
        ref.child("Users").observeSingleEvent(of: .value, with: { (jsonData) in
            self.users = jsonData.value as? [NSDictionary]
        })
    }
    
    
    @IBAction func ProfileButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as! UserCell
        let user: NSDictionary = users![indexPath.row]
        cell.userName?.text = user["Name"] as? String
        return cell
    }
}
