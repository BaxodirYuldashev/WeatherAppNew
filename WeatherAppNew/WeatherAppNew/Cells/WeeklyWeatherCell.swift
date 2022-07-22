//
//  WeeklyWeatherCell.swift
//  WeatherAppNew
//
//  Created by macbook on 7/22/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class WeeklyWeatherCell: UITableViewCell {
    
    let backView = UIView()
    let weatherImg = UIImageView()
    let weatherLabel = UILabel()
    let dailyLabel = UILabel()
    let dailyTemp = UILabel()
    let nightlyLabel = UILabel()
    let nightlyTemp = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(red: 50/255, green: 130/255, blue: 230/255, alpha: 1)
        
        contentView.addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        backView.layer.cornerRadius = 12
        
        backView.addSubview(weatherImg)
        weatherImg.translatesAutoresizingMaskIntoConstraints = false
        weatherImg.image = UIImage(named: "cloudy with sun")
        
        backView.addSubview(weatherLabel)
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherLabel.backgroundColor = .clear
        weatherLabel.text = "Clear"
        weatherLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        weatherLabel.numberOfLines = 0
        weatherLabel.textAlignment = .center
        
        backView.addSubview(dailyLabel)
        dailyLabel.translatesAutoresizingMaskIntoConstraints = false
        dailyLabel.text = "Feels during the day"
        dailyLabel.backgroundColor = .clear
        dailyLabel.font = .systemFont(ofSize: 18, weight: .medium)
        
        backView.addSubview(dailyTemp)
        dailyTemp.translatesAutoresizingMaskIntoConstraints = false
        dailyTemp.text = "25.96 °C"
        dailyTemp.backgroundColor = .clear
        dailyTemp.font = .systemFont(ofSize: 20, weight: .semibold)
        
        backView.addSubview(nightlyLabel)
        nightlyLabel.translatesAutoresizingMaskIntoConstraints = false
        nightlyLabel.text = "Feels during the night"
        nightlyLabel.backgroundColor = .clear
        nightlyLabel.font = .systemFont(ofSize: 18, weight: .medium)
        
        backView.addSubview(nightlyTemp)
        nightlyTemp.translatesAutoresizingMaskIntoConstraints = false
        nightlyTemp.text = "18.26 °C"
        nightlyTemp.backgroundColor = .clear
        nightlyTemp.font = .systemFont(ofSize: 20, weight: .semibold)
        
        
        NSLayoutConstraint.activate([
            
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            backView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            backView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            weatherImg.topAnchor.constraint(equalTo: backView.topAnchor, constant: 15),
            weatherImg.centerXAnchor.constraint(equalTo: weatherLabel.centerXAnchor),
            weatherImg.heightAnchor.constraint(equalToConstant: 80),
            weatherImg.widthAnchor.constraint(equalTo: weatherImg.heightAnchor),
            
            weatherLabel.topAnchor.constraint(equalTo: weatherImg.bottomAnchor, constant: 5),
            weatherLabel.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 10),
            weatherLabel.widthAnchor.constraint(equalToConstant: 150),
            weatherLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -25),
            
            dailyLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 20),
            dailyLabel.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -20),
            
            dailyTemp.topAnchor.constraint(equalTo: dailyLabel.bottomAnchor, constant: 10),
            dailyTemp.centerXAnchor.constraint(equalTo: dailyLabel.centerXAnchor),
            
            nightlyLabel.topAnchor.constraint(equalTo: dailyTemp.bottomAnchor, constant: 30),
            nightlyLabel.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -20),
            
            nightlyTemp.topAnchor.constraint(equalTo: nightlyLabel.bottomAnchor, constant: 10),
            nightlyTemp.centerXAnchor.constraint(equalTo: nightlyLabel.centerXAnchor),
            nightlyTemp.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -20),
            
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadData(data: Weather_Model?, index: Int) {
        weatherImg.image = UIImage(named: data?.daily[index].weather[0].icon ?? "")
        weatherLabel.text = data?.daily[index].weather[0].description ?? ""
        dailyTemp.text = "\(data?.daily[index].feels_like?.day ?? 0)"
        nightlyTemp.text = "\(data?.daily[index].feels_like?.night ?? 0)"
    }
}
