//
//  ImageLoader.swift
//  GracefulTipView
//
//  Created by Spring on 2018/3/6.
//

import UIKit

class ImageLoader {
    
    // load image from framework bundle
    static func image(named: String) -> UIImage? {
        
        let frameworkBundle = Bundle(for: ImageLoader.self)
        return UIImage(named: named, in: frameworkBundle, compatibleWith: nil)
        
    }
    
}

