//
//  WeeklyCell.swift
//  WeatherAppNew
//
//  Created by macbook on 7/22/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class WeeklyCell: UITableViewCell {
    
    let weeklyLabel = UILabel()
    let rightIcon = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(red: 50/255, green: 130/255, blue: 230/255, alpha: 1)
        
        contentView.addSubview(weeklyLabel)
        weeklyLabel.translatesAutoresizingMaskIntoConstraints = false
        weeklyLabel.backgroundColor = .clear
        weeklyLabel.textColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        weeklyLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        contentView.addSubview(rightIcon)
        rightIcon.translatesAutoresizingMaskIntoConstraints = false
        rightIcon.image = UIImage(named: "right arrow")?.withRenderingMode(.alwaysTemplate)
        rightIcon.tintColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        
        NSLayoutConstraint.activate([
            
            weeklyLabel.centerYAnchor.constraint(equalTo: rightIcon.centerYAnchor),
            weeklyLabel.rightAnchor.constraint(equalTo: rightIcon.leftAnchor, constant: -5),
            
            rightIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            rightIcon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            rightIcon.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            rightIcon.heightAnchor.constraint(equalToConstant: 20),
            rightIcon.widthAnchor.constraint(equalTo: rightIcon.heightAnchor),
            
            
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
