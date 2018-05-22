//
//  TextFieldCell.swift
//  PostApiCall
//
//  Created by Kavya on 22/05/18.
//  Copyright © 2018 Kavya. All rights reserved.
//

import UIKit

typealias textFieldCellCallBack = (_ sender: UITextField) -> Void

//public protocol TextFieldCellDelegate : NSObjectProtocol {
//    func textFieldShouldEndEditing(_ textField: UITextField)
//}

class TextFieldCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dataTextField: UITextField!
    
    var textFieldCallBack: textFieldCellCallBack?
//    var delegate : TextFieldCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.dataTextField.delegate = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func textFieldDidChange(textField: UITextField) {
        if (textFieldCallBack != nil) {
            self.textFieldCallBack!(textField)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textFieldCallBack != nil) {
            self.textFieldCallBack!(textField)
        }
        //        delegate?.textFieldShouldEndEditing(textField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
