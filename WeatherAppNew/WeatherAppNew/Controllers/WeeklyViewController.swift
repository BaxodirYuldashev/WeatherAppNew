//
//  WeeklyViewController.swift
//  WeatherAppNew
//
//  Created by macbook on 7/22/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class WeeklyViewController: UIViewController {
    
    let customView = NavigationView()
    let tableView = UITableView()
    var weather: Weather_Model?
    var cities = [City]()
    var index = Int()
    var extraRow = 1
    var currentCityName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor(red: 50/255, green: 130/255, blue: 230/255, alpha: 1)
        
        view.addSubview(customView)
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.titleLabel.text = currentCityName
        customView.leftIcon.setImage(UIImage (named: "left arrow")?.withRenderingMode(.alwaysTemplate), for: .normal)
        customView.tintColor = UIColor(red: 207/255, green: 226/255, blue: 241/255, alpha: 1)
        customView.leftIcon.addTarget(self, action: #selector(backClicked), for: .touchUpInside)
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WeeklyWeatherCell.self, forCellReuseIdentifier: "WeeklyWeatherCell")
        tableView.register(MorningCell.self, forCellReuseIdentifier: "MorningCell")
        tableView.register(Header.self, forHeaderFooterViewReuseIdentifier: "Header")
        
        NSLayoutConstraint.activate([
            
            customView.topAnchor.constraint(equalTo: view.topAnchor),
            customView.leftAnchor.constraint(equalTo: view.leftAnchor),
            customView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            tableView.topAnchor.constraint(equalTo: customView.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            ])
    }
    
    
    @objc func backClicked() {
        
        navigationController?.popViewController(animated: true)
    }
    
}

extension WeeklyViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return weather?.daily.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Header()
        
        headerView.loadData(data: weather, section: section)
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WeeklyWeatherCell") as! WeeklyWeatherCell
            cell.loadData(data: weather, index: indexPath.section)
            cell.selectionStyle = .none
            
            return cell
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MorningCell") as! MorningCell
        cell.initDates(data: weather, index: indexPath.row-extraRow, section: indexPath.section)
        cell.selectionStyle = .none
        
        return cell
        
    }
    
    
}
