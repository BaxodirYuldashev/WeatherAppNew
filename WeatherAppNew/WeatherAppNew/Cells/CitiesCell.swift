//
//  CitiesCell.swift
//  WeatherAppNew
//
//  Created by macbook on 7/22/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class CitiesCell: UITableViewCell {
    
    let nameOfCity = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(red: 50/255, green: 130/255, blue: 230/255, alpha: 1)
        
        contentView.addSubview(nameOfCity)
        nameOfCity.translatesAutoresizingMaskIntoConstraints = false
        nameOfCity.backgroundColor = .clear
        nameOfCity.font = .systemFont(ofSize: 20, weight: .semibold)
        
        NSLayoutConstraint.activate([
            
            nameOfCity.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            nameOfCity.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            nameOfCity.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            nameOfCity.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
