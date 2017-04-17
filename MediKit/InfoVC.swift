//
//  InfoVC.swift
//  MediKit
//
//  Created by Victor Elizalde on 3/18/17.
//  Copyright © 2017 Victor Elizalde. All rights reserved.
//

import UIKit

class InfoVC: UIViewController {

    @IBOutlet weak var empresaLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var misionLabel: UILabel!
    @IBOutlet weak var visionLabel: UILabel!
    @IBOutlet weak var nosotrosLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        empresaLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        misionLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        visionLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        nosotrosLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

