//
//  OnboardCollectionViewCell.swift
//  DR
//
//  Created by Amira Zahran on 02/06/2022.
//

import UIKit

class OnboardCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardCollectionViewCell.self)
    
    @IBOutlet weak var slidimageV: UIImageView!
    @IBOutlet weak var slidDesc_lbl: UILabel!
    @IBOutlet weak var slidTitle_lbl: UILabel!
    
    func setup(_ slide: OnboardingSlid) {
        slidimageV.image = UIImage(named: slide.image)
        slidTitle_lbl.text = slide.title
        slidDesc_lbl.text = slide.description
    }
}
