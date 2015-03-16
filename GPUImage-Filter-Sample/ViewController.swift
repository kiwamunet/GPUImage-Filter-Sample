//
//  ViewController.swift
//  GPUImageHoge
//
//  Created by suzuki_kiwamu on 2015/03/16.
//  Copyright (c) 2015年 suzuki_kiwamu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var currentImageV: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func toPage(sender: AnyObject) {
        var vc = SecondViewController()
        vc.originalImage = UIImage(named: "Sample")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

