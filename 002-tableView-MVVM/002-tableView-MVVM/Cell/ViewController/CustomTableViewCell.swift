//
//  CustomTableViewCell.swift
//  002-tableView-MVVM
//
//  Created by ALYSSON DODO on 14/12/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var professionLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    
    var viewModel : CustomCellViewModel?
    
    static  let identifier = "CustomTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configCell(user : User){
        self.viewModel = CustomCellViewModel(data: user)
        self.userImageView.image = UIImage(named: self.viewModel?.getImage ?? "")
        self.nameLabel.text = self.viewModel?.getName
        self.ageLabel.text = self.viewModel?.getAge
        self.professionLabel.text = self.viewModel?.getProfetion
        self.salaryLabel.text = self.viewModel?.getSalary
    }
    
}
