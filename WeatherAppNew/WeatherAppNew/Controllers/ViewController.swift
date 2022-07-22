//
//  ViewController.swift
//  WeatherAppNew
//
//  Created by macbook on 7/22/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    
    let customView = NavigationView()
    let tableView = UITableView()
    var model = Model()
    var weather: Weather_Model?
    var cities = [City]()
    var infoArr2 = [InfoModel]()
    let extraRow = 3
    var lat: Double = 41.2646
    var lon: Double = 69.2163
    var currentCityName = "Tashkent"
    var index = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData(lat: lat, lon: lon)
        infoArr2 = model.infoArr
        model.parseCities()
        cities = model.cities
        
        view.backgroundColor = UIColor(red: 50/255, green: 130/255, blue: 230/255, alpha: 1)
        
        view.addSubview(customView)
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.titleLabel.text = "Open Weather Map"
        customView.searchIcon.setImage(UIImage(named: "search"), for: .normal)
        customView.searchIcon.addTarget(self, action: #selector(search), for: .touchUpInside)
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CountryCell.self, forCellReuseIdentifier: "CountryCell")
        tableView.register(WeeklyCell.self, forCellReuseIdentifier: "WeeklyCell")
        tableView.register(CollectionViewCellorg.self, forCellReuseIdentifier: "CollectionViewCellorg")
        tableView.register(InfoCell.self, forCellReuseIdentifier: "InfoCell")
        
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    
    @objc func search(_ sender: UIButton){
        let vc = CitiesViewController()
        vc.city = cities
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// URLSession for API
extension ViewController {
    func getData(lat: Double?, lon: Double?) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat ?? 0)&lon=\(lon ?? 0)&units=metric&exclude=alerts&appid=925d96fe3a7e5e865fc3b8dfecde744a")
            else { return }
        
        URLSession.shared.dataTask(with: url) { [self] (data, response, error) in
            guard let data = data else { return }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] {
                    self.weather = Weather_Model(json)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                
            }
            catch {
                print("ERROR")
            }
            }
            .resume()
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoArr2.count + extraRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell") as! CountryCell
            cell.countryLabel.text = currentCityName
            cell.loadData(data: weather, cities: cities, index: index)
            cell.selectionStyle = .none
            return cell
        }
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WeeklyCell") as! WeeklyCell
            cell.weeklyLabel.text = "Weekly weather forecast"
            return cell
        }
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionViewCellorg") as! CollectionViewCellorg
            cell.weather = weather
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell") as! InfoCell
        
        cell.initDef(def: infoArr2[indexPath.row-extraRow])
        cell.initDatas(temp: weather, index: indexPath.row-extraRow)
        cell.selectionStyle = .none
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 1 {
            let vc = WeeklyViewController()
            vc.weather = weather
            vc.cities = cities
            vc.index = index
            vc.currentCityName = currentCityName
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

