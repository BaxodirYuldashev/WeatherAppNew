//
//  Header.swift
//  WeatherAppNew
//
//  Created by macbook on 7/22/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class Header: UITableViewHeaderFooterView {
    
    let label = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(red: 50/255, green: 130/255, blue: 230/255, alpha: 1)
        
        contentView.addSubview(label)
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        
        NSLayoutConstraint.activate([
            
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            ])
        
    }
    
    func loadData(data: Weather_Model?, section: Int) {
        
        label.text = dataFormat(date: data?.daily[section].dt ?? 0)
    }
    
    func dataFormat(date: Int) -> String {
        let date1 = Date(timeIntervalSince1970: TimeInterval(date))
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.full
        return "\(dateFormatter.string(from: date1))"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
