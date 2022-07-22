//
//  CountryCell.swift
//  WeatherAppNew
//
//  Created by macbook on 7/22/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
    
    let countryLabel = UILabel()
    let weatherImage = UIImageView()
    let weatherLabel = UILabel()
    let temperature = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(red: 50/255, green: 130/255, blue: 230/255, alpha: 1)
        
        contentView.addSubview(countryLabel)
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.backgroundColor = .clear
        countryLabel.font = .systemFont(ofSize: 22, weight: .semibold)
        
        
        contentView.addSubview(weatherImage)
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(weatherLabel)
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherLabel.backgroundColor = .clear
        weatherLabel.font = .systemFont(ofSize: 20)
        
        contentView.addSubview(temperature)
        temperature.translatesAutoresizingMaskIntoConstraints = false
        temperature.backgroundColor = .clear
        temperature.font = .systemFont(ofSize: 26, weight: .bold)
        
        NSLayoutConstraint.activate([
            
            countryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            countryLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            weatherImage.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 15),
            weatherImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            weatherImage.heightAnchor.constraint(equalToConstant: 100),
            weatherImage.widthAnchor.constraint(equalTo: weatherImage.heightAnchor),
            
            weatherLabel.topAnchor.constraint(equalTo: weatherImage.bottomAnchor, constant: 15),
            weatherLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            temperature.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 15),
            temperature.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            temperature.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
            ])
        
    }
    
    func loadData(data: Weather_Model?, cities: [City]?, index: Int) {
        weatherImage.image = UIImage(named: "\(data?.current?.weather[0].icon ?? "")")
        weatherLabel.text = "\(data?.current?.weather[0].main ?? "")"
        temperature.text = "\(data?.current?.temp ?? 0)°C"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
