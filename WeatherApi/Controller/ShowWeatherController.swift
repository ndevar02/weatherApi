//
//  ShowWeatherController.swift
//  WeatherApi
//
//  Created by Nithya Devarajan on 09/12/21.
//

import UIKit

class ShowWeatherController: UIViewController{
    
    @IBOutlet weak var imgWeather: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblSunset: UILabel!
    @IBOutlet weak var lblSunrise: UIStackView!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblSunrise1: UILabel!
    @IBOutlet weak var activitySpin: UIActivityIndicatorView!
    
    var weathermanager = WeatherManager()
    var cityname = ""
    
    override func viewDidLoad() {
        
        weathermanager.delegate = self
        // Do any additional setup after loading the view.
        
        weathermanager.getWeather(cityname:cityname)
        super.viewDidLoad()
        activitySpin.startAnimating()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        activitySpin.stopAnimating()
        activitySpin.hidesWhenStopped = true
    }
    
}

extension ShowWeatherController : WeatherManagerDelegate{
    func updatecityWeather(cityweather: CityWeather?) {
        
        guard let safeData = cityweather else {
            
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
                Util.showErrorMessage(errorMessage: "Please check City Name", controller: self)
            }
            return
        }
        
        DispatchQueue.main.async {
            
            self.lblCity.text = safeData.name
            self.lblDescription.text = safeData.description
            self.lblSunrise1.text = safeData.sunrise
            self.lblSunset.text = safeData.sunset
            self.lblTemp.text = "\( safeData.temperature)"
            
            if safeData.temperature < 0 {
                
                self.imgWeather.image = UIImage(systemName: "cloud")
                
            }
            else
            {
                self.imgWeather.image = UIImage(systemName: "sun.max")
            }
            
        }
        
        
    }
    
    
}
