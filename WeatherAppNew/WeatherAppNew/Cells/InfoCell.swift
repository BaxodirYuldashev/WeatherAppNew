//
//  InfoCell.swift
//  WeatherAppNew
//
//  Created by macbook on 7/22/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {
    
    let backView = UIView()
    let label = UILabel()
    let icon = UIImageView()
    let label2 = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(red: 50/255, green: 130/255, blue: 230/255, alpha: 1)
        
        contentView.addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.layer.cornerRadius = 12
        backView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        
        backView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.numberOfLines = 0
        
        backView.addSubview(icon)
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        backView.addSubview(label2)
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.backgroundColor = .clear
        label2.font = .systemFont(ofSize: 18, weight: .semibold)
        
        
        NSLayoutConstraint.activate([
            
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            backView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            backView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            label.topAnchor.constraint(equalTo: backView.topAnchor, constant: 20),
            label.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 15),
            label.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -20),
            label.widthAnchor.constraint(equalToConstant: 200),
            
            icon.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            icon.heightAnchor.constraint(equalToConstant: 20),
            icon.widthAnchor.constraint(equalTo: icon.heightAnchor),
            icon.rightAnchor.constraint(equalTo: label2.leftAnchor, constant: -10),
            
            label2.topAnchor.constraint(equalTo: label.topAnchor),
            label2.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -15),
            label2.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -20),
            
            ])
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initDatas(temp: Weather_Model?, index: Int) {
        if index == 0 {
            self.label2.text = "\(temp?.current?.temp ?? 0)°C"
        }
        if index == 1 {
            self.label2.text = "\(temp?.current?.feels_like ?? 0)°C"
        }
        if index == 2 {
            self.label2.text = "\(temp?.current?.pressure ?? 0)mB"
        }
        if index == 3 {
            self.label2.text = "\(temp?.current?.humidity ?? 0)%"
        }
        if index == 4 {
            self.label2.text = "\(temp?.current?.wind_speed ?? 0)m/s"
        }
    }
    
    func initDef(def: InfoModel?) {
        label.text = def?.info ?? ""
        icon.image = UIImage(named: def?.icon ?? "")
    }
    
}
