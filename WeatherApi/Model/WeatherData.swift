//
//  weatherData.swift
//  WeatherApi
//
//  Created by Nithya Devarajan on 09/12/21.
//

import Foundation

struct WeatherData : Decodable{
    let name : String
    let sys : Sys
    let main : Main
    let weather : [weather]
}
struct Sys : Decodable{
    let sunrise : Int
    let sunset : Int
}
struct Main : Decodable{
    let temp : Decimal
}
struct weather: Decodable {
    let description : String
}
