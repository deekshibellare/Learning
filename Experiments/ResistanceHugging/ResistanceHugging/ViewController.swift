//
//  ViewController.swift
//  ResistanceHugging
//
//  Created by Deekshith Bellare on 09/10/18.
//  Copyright © 2018 Deekshith Bellare. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func update() {
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        subTitleLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
        
        titleLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        
        
    }
    


}

