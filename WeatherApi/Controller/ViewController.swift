//
//  ViewController.swift
//  WeatherApi
//
//  Created by Nithya Devarajan on 09/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnSearch: UIButton!
    
    @IBOutlet weak var lblCityName: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func showWeatherDetails(_ sender: UIButton) {
        
        guard let cityName = lblCityName.text , cityName.count > 0 else {
            Util.showErrorMessage(errorMessage: "Please Enter City Name", controller: self)
            return
        }
        
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        
        let showWeather = storyBoard.instantiateViewController(withIdentifier: "showWeather") as! ShowWeatherController
        
        showWeather.cityname = lblCityName.text!
        
        
        self.navigationController?.pushViewController(showWeather, animated: true)

        
    }
    
 
}



extension ViewController : UITextViewDelegate{
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return true
    }
    
    
}

