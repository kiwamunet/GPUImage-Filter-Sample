//
//  FilterType.swift
//  GPUImageHoge
//
//  Created by suzuki_kiwamu on 2015/03/16.
//  Copyright (c) 2015年 suzuki_kiwamu. All rights reserved.
//

import Foundation

enum FilterType: Int {
    case FilterImgOrigin = 0
    case FilterImgContrast
    case FilterImgBrightness
    case FilterImgSaturation
    case FilterImgVignette
    case FilterImgMonochrome
    case FilterImggrayscale
    case _count
    static let count = Int(_count.rawValue)
}


