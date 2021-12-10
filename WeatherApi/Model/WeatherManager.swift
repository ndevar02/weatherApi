//
//  WeatherManager.swift
//  WeatherApi
//
//  Created by Nithya Devarajan on 09/12/21.
//

import Foundation

protocol WeatherManagerDelegate{
    func updatecityWeather(cityweather : CityWeather?)
}

struct WeatherManager {
    let url = "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=687e39409f49681cbe172402c5160cf7"
    var delegate: WeatherManagerDelegate?
    
    func getWeather(cityname : String) {
        let urlstring = "\(url)&q=\(cityname)"
        performWeather(urlString: urlstring)
    }
    
    
    func performWeather(urlString : String) {
        if let finalurl = URL(string: urlString){
            let session = URLSession(configuration:.default)
            let task =  session.dataTask(with: finalurl) { (data, response, error) in
                if error != nil {
                    
                }
                if let safeData = data {
                    
                    let weather :CityWeather? = self.parsejson(weatherData: safeData)
                    
                    
                    self.delegate?.updatecityWeather(cityweather: weather)
                    
                }
            }
            task.resume()
            
            
        }
        
    }
    func parsejson(weatherData: Data) -> CityWeather? {
        
        let decoder = JSONDecoder()
        do{
            let value = try decoder.decode(WeatherData.self, from: weatherData)
            
            
            let cityWeather = CityWeather(name: value.name, sunrise: value.sys.sunrise, sunset: value.sys.sunset, temperature: value.main.temp, description: value.weather[0].description)
            return cityWeather
            
        }
        catch{
            print(error)
            return nil
        }
        
        
        
    }
}
