//
//  AnyClassExtension.swift
//  AmestaApp
//
//  Created by A12893 on 2014/11/22.
//  Copyright (c) 2014年 Ameba Studio. All rights reserved.
//

import Foundation

extension String {
    init(_ clazz: AnyClass, shortName: Bool = true) {
        let longName = NSStringFromClass(clazz)
        if shortName {
            self = longName.componentsSeparatedByString(".").last!
        } else {
            self = longName
        }
    }
}
