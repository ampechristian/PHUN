//
//  TableView++.swift
//  Phunware
//
//  Created by Ampe on 4/12/17.
//  Copyright © 2017 Ampe. All rights reserved.
//

import UIKit

extension UITableView {
    
    // Function To Convert Table View To PDF
    func toPDF() -> URL {
        let priorBounds = self.bounds
        let fittedSize = self.sizeThatFits(CGSize(width: priorBounds.size.width, height: self.contentSize.height))
        self.bounds = CGRect(x: 0, y: 0, width: fittedSize.width, height: fittedSize.height)
        let pdfPageBounds = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, pdfPageBounds,nil)
        var pageOriginY: CGFloat = 0
        while pageOriginY < fittedSize.height {
            UIGraphicsBeginPDFPageWithInfo(pdfPageBounds, nil)
            UIGraphicsGetCurrentContext()!.saveGState()
            UIGraphicsGetCurrentContext()!.translateBy(x: 0, y: -pageOriginY)
            self.layer.render(in: UIGraphicsGetCurrentContext()!)
            UIGraphicsGetCurrentContext()!.restoreGState()
            pageOriginY += pdfPageBounds.size.height
        }
        UIGraphicsEndPDFContext()
        self.bounds = priorBounds
        var docURL = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last! as URL
        docURL = docURL.appendingPathComponent("GalacticInvite.pdf")
        pdfData.write(to: docURL as URL, atomically: true)
        return docURL
    }
    
    // Function To Present Sharing Options
    func share(tableViewController: UITableViewController) {
        let url = tableViewController.tableView.toPDF()
        let textToShare = [url]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = tableViewController.view
        tableViewController.present(activityViewController, animated: true, completion: nil)
    }
    
}
