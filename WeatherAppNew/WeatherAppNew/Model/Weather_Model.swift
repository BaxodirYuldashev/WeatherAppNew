//
//  Weather_Model.swift
//  WeatherAppNew
//
//  Created by macbook on 7/22/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class Model {
    
    var infoArr = [InfoModel(info: "Current temperature", icon: "temperature"),
                   InfoModel(info: "Feels like temperature", icon: "temperature2"),
                   InfoModel(info: "Atmospheric pressure at the moment", icon: "atmospheric pressure"),
                   InfoModel(info: "Current air humidity", icon: "air humidity"),
                   InfoModel(info: "Wind speed", icon: "wind speed")]
    
    var cities = [City]()
    
    func parseCities() {
        
        guard let path = Bundle.main.path(forResource: "city.list", ofType: "json") else { return }
        
        let url = URL(fileURLWithPath: path)
        if let data = try? Data(contentsOf: url) {
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: AnyObject]] {
                    for item in json {
                        cities.append(City.init(item))
                    }
                    
                }
            }
            catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        }
    }
    
}

class Weather_Model {
    var lat: Double?
    var lon: Double?
    var timezone: String?
    var timezone_offset: Int?
    var current: Current?
    var hourly = [Hourly]()
    var daily = [Daily]()
    
    init (_ json: [String: AnyObject]) {
        self.lat = json["lat"] as? Double
        self.lon = json["lon"] as? Double
        self.timezone = json["timezone"] as? String
        self.timezone_offset = json["timezone_offset"] as? Int
        
        if let obj = json["current"] as? [String: AnyObject] {
            self.current = Current.init(obj)
        }
        
        if let array = json["hourly"] as? [[String: AnyObject]] {
            var result = [Hourly]()
            for item in array {
                let obj = Hourly.init(item)
                result.append(obj)
            }
            self.hourly = result
        }
        
        if let array = json["daily"] as? [[String: AnyObject]] {
            for item in array {
                self.daily.append(Daily(item))
            }
        }
        
    }
    
}

class Current {
    var dt: Int?
    var sunrise: Int?
    var sunset: Int?
    var temp: Double?
    var feels_like: Double?
    var pressure: Int?
    var humidity: Int?
    var dew_point: Double?
    var uvi: Double?
    var clouds: Int?
    var visibility: Int?
    var wind_speed: Double?
    var wind_deg: Int?
    var weather = [Weather]()
    
    
    init (_ json: [String: AnyObject]) {
        self.dt = json["dt"] as? Int
        self.sunrise = json["sunrise"] as? Int
        self.sunset = json["sunset"] as? Int
        self.temp = json["temp"] as? Double
        self.feels_like = json["feels_like"] as? Double
        self.pressure = json["pressure"] as? Int
        self.humidity = json["humidity"] as? Int
        self.dew_point = json["dew_point"] as? Double
        self.uvi = json["uvi"] as? Double
        self.clouds = json["clouds"] as? Int
        self.visibility = json["visibility"] as? Int
        self.wind_speed = json["wind_speed"] as? Double
        self.wind_deg = json["wind_deg"] as? Int
        
        if let array = json["weather"] as? [[String: AnyObject]] {
            var result = [Weather]()
            for item in array {
                let obj = Weather.init(item)
                result.append(obj)
            }
            self.weather = result
        }
        
    }
}

class Weather {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
    
    init(_ json: [String: AnyObject]) {
        self.id = json["id"] as? Int
        self.main = json["main"] as? String
        self.description = json["description"] as? String
        self.icon = json["icon"] as? String
    }
}

class Hourly {
    var dt: Int?
    var temp: Double?
    var feels_like: Double?
    var pressure: Int?
    var humidity: Int?
    var dew_point: Double?
    var uvi: Double?
    var clouds: Int?
    var visibility: Int?
    var wind_speed: Double?
    var wind_deg: Int?
    var wind_gust: Double?
    var weather = [Weather]()
    var pop: Int?
    
    init (_ json: [String: AnyObject]) {
        self.dt = json["dt"] as? Int
        self.temp = json["temp"] as? Double
        self.feels_like = json["feels_like"] as? Double
        self.pressure = json["pressure"] as? Int
        self.humidity = json["humidity"] as? Int
        self.dew_point = json["dew_point"] as? Double
        self.uvi = json["uvi"] as? Double
        self.clouds = json["clouds"] as? Int
        self.visibility = json["visibility"] as? Int
        self.wind_speed = json["wind_speed"] as? Double
        self.wind_deg = json["wind_deg"] as? Int
        self.wind_gust = json["wind_gust"] as? Double
        
        if let array = json ["weather"] as? [[String: AnyObject]] {
            var result = [Weather]()
            for item in array {
                let obj = Weather.init(item)
                result.append(obj)
            }
            weather = result
        }
        self.pop = json["pop"] as? Int
        
        
    }
    
}

class Daily {
    var dt: Int?
    var sunrise: Int?
    var sunset: Int?
    var moonrise: Int?
    var moonset: Int?
    var moon_phase: Double?
    var temp: Temp?
    var feels_like: Feels_like?
    var pressure: Int?
    var humidity: Int?
    var dew_point: Double?
    var wind_speed: Double?
    var wind_deg: Int?
    var wind_gust: Double?
    var weather = [Weather]()
    var clouds: Int?
    var pop: Int?
    var uvi: Double?
    
    init (_ json: [String: AnyObject]) {
        self.dt = json ["dt"] as? Int
        self.sunrise = json ["sunrise"] as? Int
        self.sunset = json ["sunset"] as? Int
        self.moonrise = json ["moonrise"] as? Int
        self.moonset = json ["moonset"] as? Int
        self.moon_phase = json ["moon_phase"] as? Double
        
        if let obj = json ["temp"] as? [String: AnyObject] {
            self.temp = Temp.init(obj)
        }
        
        if let obj = json ["feels_like"] as? [String: AnyObject] {
            self.feels_like = Feels_like.init(obj)
        }
        
        self.pressure = json ["pressure"] as? Int
        self.humidity = json ["humidity"] as? Int
        self.dew_point = json ["dew_point"] as? Double
        self.wind_speed = json ["wind_speed"] as? Double
        self.wind_deg = json ["wind_deg"] as? Int
        self.wind_gust = json ["wind_gust"] as? Double
        
        if let array = json ["weather"] as? [[String: AnyObject]] {
            var result = [Weather]()
            for item in array {
                let obj = Weather.init(item)
                result.append(obj)
            }
            weather = result
        }
        
        self.clouds = json ["clouds"] as? Int
        self.pop = json ["pop"] as? Int
        self.uvi = json ["uvi"] as? Double
    }
    
}

class Temp {
    var day: Double?
    var min: Double?
    var max: Double?
    var night: Double?
    var eve: Double?
    var morn: Double?
    
    init(_ json: [String: AnyObject]) {
        self.day = json ["day"] as? Double
        self.min = json ["min"] as? Double
        self.max = json ["max"] as? Double
        self.night = json ["night"] as? Double
        self.eve = json ["eve"] as? Double
        self.morn = json ["morn"] as? Double
        
    }
}


class Feels_like {
    
    var day: Double?
    var night: Double?
    var eve: Double?
    var morn: Double?
    
    init(_ json: [String: AnyObject]) {
        self.day = json ["day"] as? Double
        self.night = json ["night"] as? Double
        self.eve = json ["eve"] as? Double
        self.morn = json ["morn"] as? Double
        
    }
    
}


class City {
    var id: Double?
    var name: String?
    var state: String?
    var country: String?
    var coord: Coord?
    
    init(_ json: [String:AnyObject]) {
        self.id = json ["id"] as? Double
        self.name = json ["name"] as? String
        self.state = json ["state"] as? String
        self.country = json ["country"] as? String
        
        if let obj = json ["coord"] as? [String:AnyObject] {
            self.coord = Coord.init(obj)
        }
        
    }
}

class Coord {
    var lon: Double?
    var lat: Double?
    
    init (_ json: [String:AnyObject]) {
        self.lon = json ["lon"] as? Double
        self.lat = json ["lat"] as? Double
    }
}

class InfoModel {
    var info: String?
    var icon: String?
    
    init (info: String, icon: String) {
        self.info = info
        self.icon = icon
    }
}
