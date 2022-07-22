//
//  CitiesViewController.swift
//  WeatherAppNew
//
//  Created by macbook on 7/22/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController {
    
    let customView = NavigationView()
    let tableView = UITableView()
    var model = Model()
    var city = [City]()
    var searchBar = UISearchBar()
    var filterData = [City]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterData = city
        
        view.backgroundColor = UIColor(red: 50/255, green: 130/255, blue: 230/255, alpha: 1)
        
        view.addSubview(customView)
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.titleLabel.text = "Cities"
        customView.leftIcon.setImage(UIImage(named: "left arrow"), for: .normal)
        customView.leftIcon.addTarget(self, action: #selector(backClicked), for: .touchUpInside)
        
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Search"
        searchBar.delegate = self
        searchBar.autocorrectionType = .yes
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CitiesCell.self, forCellReuseIdentifier: "CitiesCell")
        
        NSLayoutConstraint.activate([
            
            customView.topAnchor.constraint(equalTo: view.topAnchor),
            customView.leftAnchor.constraint(equalTo: view.leftAnchor),
            customView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            searchBar.topAnchor.constraint(equalTo: customView.bottomAnchor),
            searchBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            searchBar.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            ])
        
    }
    
    @objc func backClicked (_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension CitiesViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CitiesCell") as! CitiesCell
        cell.nameOfCity.text = "\(filterData[indexPath.row].name ?? "")," + " \(filterData[indexPath.row].country ?? "")"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ViewController()
        vc.lat = filterData[indexPath.row].coord?.lat ?? 0
        vc.lon = filterData[indexPath.row].coord?.lon ?? 0
        vc.currentCityName = filterData[indexPath.row].name ?? ""
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filterData = searchText.isEmpty ? city : city.filter({$0.name?.range(of: searchText, options: .caseInsensitive) != nil })
        
        tableView.reloadData()
        
    }
    
    
}
