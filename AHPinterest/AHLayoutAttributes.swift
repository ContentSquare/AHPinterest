//
//  AHLayoutAttributes.swift
//  AHPinterest
//
//  Created by Andy Hurricane on 3/26/17.
//  Copyright © 2017 AndyHurricane. All rights reserved.
//

import UIKit

class AHLayoutAttributes: UICollectionViewLayoutAttributes {
    var imageHeight: CGFloat = 0.0
    var noteHeight: CGFloat = 0.0
    
    override func copy(with zone: NSZone? = nil) -> Any {
        let copy = super.copy(with: zone) as! AHLayoutAttributes
        copy.imageHeight = self.imageHeight
        copy.noteHeight = self.noteHeight
        return copy
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let otherObj = object as? AHLayoutAttributes{
            if (otherObj.imageHeight - self.imageHeight) < 0.01 && (otherObj.noteHeight - self.noteHeight) < 0.01{
                return super.isEqual(otherObj)
            }
        }else{
            return false
        }
        return false
    }
}
