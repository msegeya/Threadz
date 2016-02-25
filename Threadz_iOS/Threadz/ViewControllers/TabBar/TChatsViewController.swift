//
//  TChatsViewController.swift
//  Threadz
//
//  Created by Hammad Mushtaq on 2/15/16.
//  Copyright © 2016 Hammad Mushtaq. All rights reserved.
//

import UIKit
import RealmSwift

class TChatsViewController: UITableViewController {

    var chats : [Group] {
        get {
            return TSessionManager.currentUser!.groups
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.chats.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TCellIdChat, forIndexPath: indexPath)
        return cell
    }
    
}
