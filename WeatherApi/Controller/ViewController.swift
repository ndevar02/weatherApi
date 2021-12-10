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
        
        
        if let cityname = lblCityName.text {
            if cityname !=  "" {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                
                
                let showWeather = storyBoard.instantiateViewController(withIdentifier: "showWeather") as! ShowWeatherController
                
                showWeather.cityname = lblCityName.text!
                
                
                self.navigationController?.pushViewController(showWeather, animated: true)
            }
            else
            {
                
                let uialert = UIAlertController(title : "", message: "Please enter city name",
                                                preferredStyle: UIAlertController.Style.alert)
                uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
                self.present(uialert, animated: true, completion: nil)
            }
            
        }
        
        
    }
}

extension ViewController : UITextViewDelegate{
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        
        return true
    }
    
    
}

