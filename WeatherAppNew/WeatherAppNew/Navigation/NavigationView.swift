//
//  NavigationView.swift
//  WeatherAppNew
//
//  Created by macbook on 7/22/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class NavigationView: UIView {
    
    let titleLabel = UILabel()
    let searchIcon = UIButton()
    let leftIcon = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 110/255, green: 120/255, blue: 260/255, alpha: 0.8)
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        
        addSubview(searchIcon)
        searchIcon.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(leftIcon)
        leftIcon.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            
            searchIcon.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            searchIcon.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            searchIcon.heightAnchor.constraint(equalToConstant: 25),
            searchIcon.widthAnchor.constraint(equalTo: searchIcon.heightAnchor),
            searchIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            
            leftIcon.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            leftIcon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            leftIcon.heightAnchor.constraint(equalToConstant: 20),
            leftIcon.widthAnchor.constraint(equalTo: leftIcon.heightAnchor),
            leftIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

