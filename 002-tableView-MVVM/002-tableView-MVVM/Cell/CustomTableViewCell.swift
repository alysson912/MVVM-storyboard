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
    
    static  let identifier = "CustomTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configCell(data : Pessoa){
        self.userImageView.image = data.imageUser
        self.nameLabel.text = "Nome: \(data.name)"
        self.ageLabel.text = "Idade: \(data.age)"
        self.professionLabel.text = "Profissão: \(data.profession)"
        self.salaryLabel.text = "Salário: \(data.salary)"
        
        userImageView.clipsToBounds = true
        userImageView.layer.cornerRadius = self.userImageView.frame.height / 2
    }
    
}
