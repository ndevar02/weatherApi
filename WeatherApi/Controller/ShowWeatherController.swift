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
        
        if cityweather !=  nil {
            DispatchQueue.main.async {
                
                if let safeData = cityweather{
                    self.lblCity.text = safeData.name
                    self.lblDescription.text = safeData.description
                    self.lblSunrise1.text = String( safeData.sunrise)
                    self.lblSunset.text = String (safeData.sunset)
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
        else
        {
            DispatchQueue.main.async {
                
                self.navigationController?.popViewController(animated: true)
                
                let uialert = UIAlertController(title : "", message: "Please check city name",
                                                preferredStyle: UIAlertController.Style.alert)
                uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
                self.present(uialert, animated: true, completion: nil)
                
            }
            
        }
        
        
        
        
    }
    
    
}
