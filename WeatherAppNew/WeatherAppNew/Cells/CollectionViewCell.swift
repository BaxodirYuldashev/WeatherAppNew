//
//  CollectionViewCell.swift
//  WeatherAppNew
//
//  Created by macbook on 7/22/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let clockLabel = UILabel()
    let temperature = UILabel()
    let weatherImage = UIImageView()
    let windSpeed = UILabel()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        contentView.backgroundColor = .clear
        
        contentView.addSubview(clockLabel)
        clockLabel.translatesAutoresizingMaskIntoConstraints = false
        clockLabel.backgroundColor = .clear
        clockLabel.textAlignment = .center
        clockLabel.font = .systemFont(ofSize: 18, weight: .light)
        
        contentView.addSubview(temperature)
        temperature.translatesAutoresizingMaskIntoConstraints = false
        temperature.backgroundColor = .clear
        temperature.textAlignment = .center
        temperature.font = .systemFont(ofSize: 22, weight: .semibold)
        
        contentView.addSubview(weatherImage)
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(windSpeed)
        windSpeed.translatesAutoresizingMaskIntoConstraints = false
        windSpeed.backgroundColor = .clear
        windSpeed.textAlignment = .center
        windSpeed.font = .systemFont(ofSize: 18, weight: .medium)
        
        NSLayoutConstraint.activate([
            
            clockLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            clockLabel.centerXAnchor.constraint(equalTo: weatherImage.centerXAnchor),
            
            temperature.topAnchor.constraint(equalTo: clockLabel.bottomAnchor, constant: 10),
            temperature.centerXAnchor.constraint(equalTo: weatherImage.centerXAnchor),
            
            weatherImage.topAnchor.constraint(equalTo: temperature.bottomAnchor, constant: 20),
            weatherImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            weatherImage.heightAnchor.constraint(equalToConstant: 80),
            weatherImage.widthAnchor.constraint(equalTo: weatherImage.heightAnchor),
            
            windSpeed.topAnchor.constraint(equalTo: weatherImage.bottomAnchor, constant: 20),
            windSpeed.centerXAnchor.constraint(equalTo: weatherImage.centerXAnchor),
            windSpeed.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            ])
        
        
        
    }
    func loadData (data: Weather_Model?, index: Int) {
        
        let date = Date(timeIntervalSince1970: TimeInterval(data?.hourly[index].dt ?? 0))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en-gb")
        dateFormatter.timeZone = TimeZone(identifier: data?.timezone ?? "")
        dateFormatter.dateFormat = "HH:mm"
        
        clockLabel.text = "\(dateFormatter.string(from: date))"
        temperature.text = String(data?.hourly[index].temp ?? 0)
        weatherImage.image = UIImage(named: "\(data?.hourly[index].weather[0].icon ?? "")")
        windSpeed.text = "\(data?.hourly[index].wind_speed ?? 0)m/s"
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
