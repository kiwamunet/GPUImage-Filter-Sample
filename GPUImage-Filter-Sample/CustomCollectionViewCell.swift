//
//  CustomCollectionViewCell.swift
//  GPUImageHoge
//
//  Created by suzuki_kiwamu on 2015/03/16.
//  Copyright (c) 2015年 suzuki_kiwamu. All rights reserved.
//

import UIKit


class CustomCollectionViewCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBOutlet weak var filterImageView: UIImageView!
}
