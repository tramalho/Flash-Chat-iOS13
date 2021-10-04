//
//  MessageTableViewCell.swift
//  Flash Chat iOS13
//
//  Created by Thiago Antonio Ramalho on 02/10/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    
    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var rightAvatarImageView: UIImageView!
    
    @IBOutlet weak var leftAvatarImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageBubble.layer.cornerRadius = messageBubble.layer.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(message: Message, isCurrent: Bool) {
        var leftImageHidden = false
        var bubbleBackgroundColor = K.BrandColors.lightPurple
        var textColor = K.BrandColors.purple
        
        if isCurrent {
            leftImageHidden = true
            bubbleBackgroundColor = K.BrandColors.purple
            textColor = K.BrandColors.lightPurple
        }
        
        leftAvatarImageView.isHidden = leftImageHidden
        rightAvatarImageView.isHidden = !leftImageHidden
        messageBubble.backgroundColor = UIColor(named: bubbleBackgroundColor)
        messageLabel.textColor = UIColor(named: textColor)
        
        messageLabel.text = message.body
    }
}
