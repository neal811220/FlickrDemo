//
//  Bundle+Extension.swift
//  FlickrDemo
//
//  Created by Neal on 2020/4/11.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation

extension Bundle {
    // swiftlint:disable force_cast
    static func NAValueForString(key: String) -> String {
        
        return Bundle.main.infoDictionary![key] as! String
    }

    static func NAValueForInt32(key: String) -> Int32 {

        return Bundle.main.infoDictionary![key] as! Int32
    }
    // swiftlint:enable force_cast
}
