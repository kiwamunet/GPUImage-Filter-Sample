//
//  SecondViewController.swift
//  GPUImageHoge
//
//  Created by suzuki_kiwamu on 2015/03/16.
//  Copyright (c) 2015年 suzuki_kiwamu. All rights reserved.
//

import UIKit


private let CustomCollectionViewCellIdentifier = String(CustomCollectionViewCell)

class SecondViewController: UIViewController {
    required init(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    override init() {
        super.init(nibName: String(SecondViewController), bundle: nil)
    }
    
    
    // MARK: Propertya
    var originalImage: UIImage?
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var exportImageView: UIImageView!
    @IBOutlet weak var myCollection: UICollectionView!
    
    
    // MARK: viewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarHidden = true
        self.setNeedsStatusBarAppearanceUpdate()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        myCollection.registerNib(UINib(nibName: String(CustomCollectionViewCell), bundle: nil), forCellWithReuseIdentifier:CustomCollectionViewCellIdentifier)
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        mainImageView.image = originalImage
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    
    // MARK: UICollectionView Delegate Method
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: CustomCollectionViewCell = myCollection.dequeueReusableCellWithReuseIdentifier(CustomCollectionViewCellIdentifier, forIndexPath: indexPath) as CustomCollectionViewCell
        
        switch FilterType(rawValue: indexPath.row)! {
        case FilterType.FilterImgOrigin:
            cell.filterImageView.image = GPUImageFilterHelper.sharedInstance.filterImageWithFilterType(FilterType.FilterImgOrigin, originImage: originalImage!, valueO: 0.5)
        case FilterType.FilterImgContrast :
            cell.filterImageView.image = GPUImageFilterHelper.sharedInstance.filterImageWithFilterType(FilterType.FilterImgContrast, originImage: originalImage!, valueO: 0.5)
        case FilterType.FilterImgBrightness :
            cell.filterImageView.image = GPUImageFilterHelper.sharedInstance.filterImageWithFilterType(FilterType.FilterImgBrightness, originImage: originalImage!, valueO: 0.5)
        case FilterType.FilterImgSaturation :
            cell.filterImageView.image = GPUImageFilterHelper.sharedInstance.filterImageWithFilterType(FilterType.FilterImgSaturation, originImage: originalImage!, valueO: 0.5)
        case FilterType.FilterImgVignette :
            cell.filterImageView.image = GPUImageFilterHelper.sharedInstance.filterImageWithFilterType(FilterType.FilterImgVignette, originImage: originalImage!, valueO: 0.5)
        case FilterType.FilterImgMonochrome :
            cell.filterImageView.image = GPUImageFilterHelper.sharedInstance.filterImageWithFilterType(FilterType.FilterImgMonochrome, originImage: originalImage!, valueO: 0.5)
        case FilterType.FilterImggrayscale :
            cell.filterImageView.image = GPUImageFilterHelper.sharedInstance.filterImageWithFilterType(FilterType.FilterImggrayscale, originImage: originalImage!, valueO: 0.5)
        default:
            cell.filterImageView.image = GPUImageFilterHelper.sharedInstance.filterImageWithFilterType(FilterType.FilterImgOrigin, originImage: originalImage!, valueO: 0.5)
        }
        return cell
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FilterType.count
    }
    
 
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = myCollection.cellForItemAtIndexPath(indexPath)
        
        switch FilterType(rawValue: indexPath.row)! {
        case FilterType.FilterImgOrigin:
            mainImageView.image = GPUImageFilterHelper.sharedInstance.filterImageWithFilterType(FilterType.FilterImgOrigin, originImage: originalImage!, valueO: 0.5)
        case FilterType.FilterImgContrast :
            mainImageView.image = GPUImageFilterHelper.sharedInstance.filterImageWithFilterType(FilterType.FilterImgContrast, originImage: originalImage!, valueO: 0.5)
        case FilterType.FilterImgBrightness :
            mainImageView.image = GPUImageFilterHelper.sharedInstance.filterImageWithFilterType(FilterType.FilterImgBrightness, originImage: originalImage!, valueO: 0.5)
        case FilterType.FilterImgSaturation :
            mainImageView.image = GPUImageFilterHelper.sharedInstance.filterImageWithFilterType(FilterType.FilterImgSaturation, originImage: originalImage!, valueO: 0.5)
        case FilterType.FilterImgVignette :
            mainImageView.image = GPUImageFilterHelper.sharedInstance.filterImageWithFilterType(FilterType.FilterImgVignette, originImage: originalImage!, valueO: 0.5)
        case FilterType.FilterImgMonochrome :
            mainImageView.image = GPUImageFilterHelper.sharedInstance.filterImageWithFilterType(FilterType.FilterImgMonochrome, originImage: originalImage!, valueO: 0.5)
        case FilterType.FilterImggrayscale :
            mainImageView.image = GPUImageFilterHelper.sharedInstance.filterImageWithFilterType(FilterType.FilterImggrayscale, originImage: originalImage!, valueO: 0.5)
        default:
            mainImageView.image = GPUImageFilterHelper.sharedInstance.filterImageWithFilterType(FilterType.FilterImgOrigin, originImage: originalImage!, valueO: 0.5)
        }
        
        
        exportImageView.image = mainImageView.image
    }
}

