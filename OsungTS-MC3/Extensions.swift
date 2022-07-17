//
//  File.swift
//  OsungTS-MC3
//
//  Created by Kim Insub on 2022/07/12.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    static var identifier: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
}

extension UICollectionViewCell {
    
    static var identifier: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
}

extension UIImage {
 
    func applyBlur_usingClamp(radius: CGFloat) -> UIImage {
        let context = CIContext()
        guard let ciImage = CIImage(image: self),
            let clampFilter = CIFilter(name: "CIAffineClamp"),
            let blurFilter = CIFilter(name: "CIGaussianBlur") else {
            return self
        }
        clampFilter.setValue(ciImage, forKey: kCIInputImageKey)
        blurFilter.setValue(clampFilter.outputImage, forKey: kCIInputImageKey)
        blurFilter.setValue(radius, forKey: kCIInputRadiusKey)
        guard let output = blurFilter.outputImage,
            let cgimg = context.createCGImage(output, from: ciImage.extent) else {
            return self
        }

        return UIImage(cgImage: cgimg)
    }
}

