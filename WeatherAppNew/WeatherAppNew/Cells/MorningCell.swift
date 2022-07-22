//
//  MorningCell.swift
//  WeatherAppNew
//
//  Created by macbook on 7/22/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class MorningCell: UITableViewCell {
    
    let backView = UIView()
    let morningLbl = UILabel()
    let morningTemp = UILabel()
    let dailyLabel = UILabel()
    let dailyTemp = UILabel()
    let eveningLbl = UILabel()
    let eveningTemp = UILabel()
    let nightlyLabel = UILabel()
    let nightlyTemp = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(red: 50/255, green: 130/255, blue: 230/255, alpha: 1)
        
        contentView.addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        backView.layer.cornerRadius = 12
        
        backView.addSubview(morningLbl)
        morningLbl.translatesAutoresizingMaskIntoConstraints = false
        morningLbl.textAlignment = .center
        morningLbl.font = .systemFont(ofSize: 17, weight: .medium)
        
        backView.addSubview(morningTemp)
        morningTemp.translatesAutoresizingMaskIntoConstraints = false
        morningTemp.backgroundColor = .clear
        morningTemp.textAlignment = .center
        morningTemp.font = .systemFont(ofSize: 19, weight: .semibold)
        
        backView.addSubview(dailyLabel)
        dailyLabel.translatesAutoresizingMaskIntoConstraints = false
        dailyLabel.textAlignment = .center
        dailyLabel.backgroundColor = .clear
        dailyLabel.font = .systemFont(ofSize: 17, weight: .medium)
        
        backView.addSubview(dailyTemp)
        dailyTemp.translatesAutoresizingMaskIntoConstraints = false
        dailyTemp.textAlignment = .center
        dailyTemp.backgroundColor = .clear
        dailyTemp.font = .systemFont(ofSize: 19, weight: .semibold)
        
        backView.addSubview(eveningLbl)
        eveningLbl.translatesAutoresizingMaskIntoConstraints = false
        eveningLbl.textAlignment = .center
        eveningLbl.backgroundColor = .clear
        eveningLbl.font = .systemFont(ofSize: 17, weight: .medium)
        
        backView.addSubview(eveningTemp)
        eveningTemp.translatesAutoresizingMaskIntoConstraints = false
        eveningTemp.textAlignment = .center
        eveningTemp.backgroundColor = .clear
        eveningTemp.font = .systemFont(ofSize: 19, weight: .semibold)
        
        backView.addSubview(nightlyLabel)
        nightlyLabel.translatesAutoresizingMaskIntoConstraints = false
        nightlyLabel.textAlignment = .center
        nightlyLabel.backgroundColor = .clear
        nightlyLabel.font = .systemFont(ofSize: 17, weight: .medium)
        nightlyLabel.numberOfLines = 0
        
        backView.addSubview(nightlyTemp)
        nightlyTemp.translatesAutoresizingMaskIntoConstraints = false
        nightlyTemp.textAlignment = .center
        nightlyTemp.backgroundColor = .clear
        nightlyTemp.font = .systemFont(ofSize: 19, weight: .semibold)
        
        
        NSLayoutConstraint.activate([
            
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            backView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            backView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            morningLbl.topAnchor.constraint(equalTo: backView.topAnchor, constant: 20),
            morningLbl.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 15),
            morningLbl.widthAnchor.constraint(equalToConstant: 170),
            
            morningTemp.topAnchor.constraint(equalTo: morningLbl.bottomAnchor, constant: 10),
            morningTemp.leftAnchor.constraint(equalTo: morningLbl.leftAnchor),
            morningTemp.widthAnchor.constraint(equalTo: morningLbl.widthAnchor),
            
            dailyLabel.topAnchor.constraint(equalTo: morningTemp.bottomAnchor, constant: 30),
            dailyLabel.leftAnchor.constraint(equalTo: morningLbl.leftAnchor),
            dailyLabel.widthAnchor.constraint(equalTo: morningLbl.widthAnchor),
            
            dailyTemp.topAnchor.constraint(equalTo: dailyLabel.bottomAnchor, constant: 10),
            dailyTemp.leftAnchor.constraint(equalTo: dailyLabel.leftAnchor),
            dailyTemp.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -20),
            dailyTemp.widthAnchor.constraint(equalTo: morningLbl.widthAnchor),
            
            eveningLbl.topAnchor.constraint(equalTo: morningLbl.topAnchor),
            eveningLbl.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -15),
            eveningLbl.widthAnchor.constraint(equalTo: morningLbl.widthAnchor),
            
            eveningTemp.topAnchor.constraint(equalTo: morningTemp.topAnchor),
            eveningTemp.rightAnchor.constraint(equalTo: eveningLbl.rightAnchor),
            eveningTemp.widthAnchor.constraint(equalTo: morningTemp.widthAnchor),
            
            nightlyLabel.topAnchor.constraint(equalTo: dailyLabel.topAnchor),
            nightlyLabel.rightAnchor.constraint(equalTo: eveningLbl.rightAnchor),
            nightlyLabel.widthAnchor.constraint(equalTo: dailyLabel.widthAnchor),
            
            nightlyTemp.topAnchor.constraint(equalTo: nightlyLabel.bottomAnchor, constant: 15),
            nightlyTemp.rightAnchor.constraint(equalTo: nightlyLabel.rightAnchor),
            nightlyTemp.bottomAnchor.constraint(equalTo: dailyTemp.bottomAnchor),
            nightlyTemp.widthAnchor.constraint(equalTo: dailyTemp.widthAnchor),
            
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initDates(data: Weather_Model?, index: Int, section: Int) {
        
        if index == 0 {
            morningLbl.text = "Morning temperature"
            morningTemp.text = String(data?.daily[section].temp?.morn ?? 0)
            dailyLabel.text = "Daily temperature"
            dailyTemp.text = String(data?.daily[section].temp?.day ?? 0)
            eveningLbl.text = "Evening temperature"
            eveningTemp.text = String(data?.daily[section].temp?.eve ?? 0)
            nightlyLabel.text = "Nightly temperature"
            nightlyTemp.text = String(data?.daily[section].temp?.night ?? 0)
        }
        
        if index == 1 {
            morningTemp.text = dateFormat(date: data?.daily[section].sunrise ?? 0)
            morningLbl.text = "Sunrise"
            
            
            dailyTemp.text = dateFormat(date: data?.daily[section].moonrise ?? 0)
            dailyLabel.text = "Moonrise"
            
            
            eveningTemp.text = dateFormat(date: data?.daily[section].sunset ?? 0)
            eveningLbl.text = "Sunset"
            
            
            nightlyTemp.text = dateFormat(date: data?.daily[section].moonset ?? 0)
            nightlyLabel.text = "Moonset"
            
        }
        
        if index == 2 {
            morningLbl.text = "Humidity"
            morningTemp.text = String(data?.daily[section].humidity ?? 0) + "%"
            eveningLbl.text = "Pressure"
            eveningTemp.text = String(data?.daily[section].pressure ?? 0) + " mBar"
            dailyLabel.text = "Wind speed"
            dailyTemp.text = String(data?.daily[section].wind_speed ?? 0) + " m/sec"
            nightlyLabel.text = "Probability of precipitation"
            nightlyTemp.text = String(data?.daily[section].pop ?? 0) + "%"
        }
        
    }
    
    func dateFormat(date: Int) -> String {
        
        let data1 = Date(timeIntervalSince1970: TimeInterval(date))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en-gb")
        dateFormatter.dateFormat = "HH:mm"
        return "\(dateFormatter.string(from: data1))"
    }
}
