//
//  DetailsTVC.swift
//  Phunware
//
//  Created by Ampe on 4/12/17.
//  Copyright © 2017 Ampe. All rights reserved.
//

import UIKit

// MARK: - Controller Lifecycle
class DetailsTVC: UITableViewController {
    
    @IBOutlet weak var header: DetailHeader!
    @IBOutlet weak var gradientView: GradientView!
    
    @IBAction func backPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sharePressed(_ sender: Any) {
        tableView.share(tableViewController: self)
    }
    
    fileprivate let headerHeight: CGFloat = 316
    
    var event: EventModel? {
        didSet { tableView.reloadData() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        setHeaderConstants()
        setGradientConstants()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateHeaderView()
    }

}

// MARK: - Table Data Source
extension DetailsTVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailcell", for: indexPath)
        if let detailCell = cell as? DetailCell {
            detailCell.event = event
        }
        return cell
    }
    
}

// MARK: - Scroll Delegate
extension DetailsTVC {
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
}

// MARK: - UI Functions
extension DetailsTVC {
    
    // General UI Updates
    fileprivate func updateUI() {
        navigationController?.hide()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        header.bounds.size.height = tableView.bounds.height/3
        header = tableView.tableHeaderView as! DetailHeader!
        tableView.tableHeaderView = nil
        tableView.addSubview(header)
    }
    
    // Set Up Header Constants
    fileprivate func setHeaderConstants() {
        tableView.contentInset = UIEdgeInsets(top: headerHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -headerHeight)
    }
    
    // Generate Image Gradient
    fileprivate func setGradientConstants() {
        gradientView.colors = [UIColor.clear, UIColor.white]
        gradientView.locations = [0.5, 1.0]
        gradientView.direction = .vertical
        gradientView.backgroundColor = UIColor.clear
    }
    
    // Update Header Size On Scroll
    fileprivate func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -headerHeight, width: tableView.bounds.width, height: headerHeight)
        if tableView.contentOffset.y < -headerHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        header.frame = headerRect
    }
    
}
