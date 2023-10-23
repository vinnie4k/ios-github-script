//
//  FeedVC.swift
//  A3
//
//  Created by Vin Bui on 7/9/23.
//

import UIKit

class FeedVC: UIViewController {
    
    // MARK: - Properties (view)
    
    private let tableView = UITableView()
    
    // MARK: - Properties (data)
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ChatDev"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = UIColor.a3.offWhite
        
        setupTableView()
    }
    
    // MARK: - Set Up Views
    
    private func setupTableView() {
        tableView.backgroundColor = UIColor.a3.offWhite
        tableView.separatorStyle = .none
        
        let padding: CGFloat = 24   // Use this constant when configuring constraints
        
        // TODO: Set Up TableView
    }
    
}

// MARK: - UITableViewDataSource

extension FeedVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: Return the cells for each section
        // HINT: Use `indexPath.section` with an if statement
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: Return the number of rows for each section
        // HINT: Use `indexPath.section` with an if statement
        
        return 0 // Replace this line
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // TODO: Return the number of sections in this table view
        
        return 0 // Replace this line
    }
    
}
