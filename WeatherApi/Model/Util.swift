//
//  Util.swift
//  WeatherApi
//
//  Created by Nithya Devarajan on 13/12/21.
//

import Foundation
import UIKit

public class Util {
    
    public static func showErrorMessage(errorMessage:String , controller : UIViewController ){
        
        let uialert = UIAlertController(title : "", message: errorMessage,
                                        preferredStyle: UIAlertController.Style.alert)
        uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        controller.present(uialert, animated: true, completion: nil)
        
    }
    
    public static func formatDate(inputString :Int)->String{
        let date = NSDate(timeIntervalSince1970: TimeInterval(inputString))
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy HH:mm" //yyyy
        return formatter.string(from: date as Date)
    }
}
