//
//  AtmListCell.swift
//  MapNavigator
//
//  Created by Claudio Sobrinho on 29/10/2018.
//  Copyright © 2018 Claudio Sobrinho. All rights reserved.
//

import UIKit

class AtmListCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var taglineLable: UILabel!
    @IBOutlet weak var atmImageView: UIImageView!
    @IBOutlet weak var identifyingColoredBar: UIView!
    
    // MARK: Properties
    class var identifier: String {return "AtmListCell"}
    static let nibName = "AtmListCell"
    
    //MARK: - Appearance
    func configureAppearance(withColor color: UIColor) {
        identifyingColoredBar.backgroundColor = color
    }
}

//MARK: - AtmListCellViewModel
extension AtmListCell {
    
    func configure(withViewModel vm: AtmListCellViewModel) {
        atmImageView.image = vm.atmImage
        configureAppearance(withColor: UIColor.gray)
        
        nameLable.text = vm.topLabelText
        taglineLable.text = vm.bottomLabelText
        distanceLabel.text = vm.rightLabelText
    }
}
