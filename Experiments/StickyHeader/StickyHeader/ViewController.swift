//
//  ViewController.swift
//  StickyHeader
//
//  Created by Deekshith Bellare on 26/09/18.
//  Copyright © 2018 Deekshith Bellare. All rights reserved.
//

import UIKit

class ListItemTableViewCell: UITableViewCell {
    @IBOutlet var taskLabel: UILabel!
}

class ViewController: UIViewController {
    @IBOutlet var listTableView: UITableView!
    @IBOutlet var headerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var headerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        headerViewHeightConstraint.constant = 0
        listTableView.estimatedRowHeight = 100
        listTableView.rowHeight = 100

        // Do any additional setup after loading the view, typically from a nib.
    }

    func animateHeaderView(show: Bool, offset: CGFloat = 0) {
        if show {
            headerViewHeightConstraint.constant = offset
            print(headerViewHeightConstraint.constant)
        } else {
            headerViewHeightConstraint.constant = 0
        }

        UIView.animate(withDuration: 0.3, animations: {
            self.headerView.alpha = show ? 1 : 0
            self.view.layoutIfNeeded()
        }) { _ in
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 30
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! ListItemTableViewCell

        switch indexPath.row {
        case 0:
            cell.taskLabel.text = "Man Utd were knocked out of the Carabao Cup by Derby County, a side managed by one time Mourinho favorite Frank Lampard. Derby edged Utd 8-7 in penalties, after the sides drew 2-2. Mata gave Utd the lead before Wilson equalized with a stunning freekick. Derby led in the 87th min, only for Fellaini to equalize on 95 mins. Phil Jones missed for United in sudden death."

        case 1:
            cell.taskLabel.text = "The Pirates Of The Caribbean screenwriters Ted Elliott and Terry Rossio revealed that the iconic character of Jack Sparrow was inspired by the shades of Lord Krishna"

        case 2:
            cell.taskLabel.text = "The Supreme Court in its judgment ruled out bank Aadhaar should not be linked to accounts, mobile numbers"

        case 3:
            cell.taskLabel.text = "Swollen feet is not always caused due to illness. It can be due to a lot of reasons - right from weight gain to lifestyle factors. While there are several home remedies to treat swollen feet, there's nothing that can match aloe vera. It helps to soothe irritation and reduce pain, thereby healing swollen feet."

        case 4:
            cell.taskLabel.text = "Mourinho had little faith in Jones"
        default:
            cell.taskLabel.text = "Technology has taken us back to thumb"
        }

        return cell
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let initalThresold = CGFloat(100)
        let finalThresold = CGFloat(200)
        let heightOfView = CGFloat(100)
        if scrollView.contentOffset.y > initalThresold && scrollView.contentOffset.y < finalThresold && headerViewHeightConstraint.constant <= heightOfView {
            let offset = abs(scrollView.contentOffset.y - initalThresold)
            animateHeaderView(show: true, offset: offset)
        } else if scrollView.contentOffset.y < 100 && headerViewHeightConstraint.constant != 0 {
            animateHeaderView(show: false)
        }
    }

//    func isCellVisible(at indexPath:IndexPath) -> Bool {
//        let cellRect = listTableView.rectForRow(at: indexPath)
//        return listTableView.bounds.contains(cellRect)
//    }
}
