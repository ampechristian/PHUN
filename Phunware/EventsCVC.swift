//
//  EventsCVC.swift
//  Phunware
//
//  Created by Ampe on 4/11/17.
//  Copyright © 2017 Ampe. All rights reserved.
//

import UIKit

// MARK: - Controller Lifecycle
class EventsCVC: UICollectionViewController {
    
    let network = Network.sharedInstance
    let vars = Global.sharedInstance
    
    var events = [[EventModel]]() {
        didSet { collectionView?.reloadData() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "todetail" {
            guard let nav = segue.destination as? UINavigationController else { return }
            guard let vc = nav.topViewController as? DetailsTVC else { return }
            guard let indexPath = collectionView?.indexPathsForSelectedItems?[0] else { return }
            vc.event = events[indexPath.section][indexPath.row]
            vc.header.event = events[indexPath.section][indexPath.row]
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        guard let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        flowLayout.invalidateLayout()
    }
    
    // Check If Data Exists On Disk Or Needs To Be Loaded
    private func loadData() {
        if let events = PersistenceManager.loadNSArray(path: .Events) {
            self.events.append(events as! [EventModel])
        } else { network.fetch { (events) in
            self.events.append(events)
            PersistenceManager.saveNSArray(arrayToSave: events as NSArray, path: .Events)
            }
        }
    }
    
}

// MARK: - Collection Data Source
extension EventsCVC {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return events.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events[section].count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventcell", for: indexPath)
        let event = events[indexPath.section][indexPath.row]
        if let eventCell = cell as? EventsCell {
            eventCell.event = event
        }
        return cell
    }
    
}

// MARK: - Collection Delegate
extension EventsCVC {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "todetail", sender: indexPath)
    }
    
}

// MARK: - Collection Layout
extension EventsCVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width/vars.cols, height: collectionView.bounds.height/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
