//
//  HomeModel.swift
//  United Pixels
//
//  Created by Ideal Cocaj on 27.3.21.
//

import Foundation

class HomeModel{
    var homeImage:String
    var homeItemsLeft: Int
    var homeTittle:String
    var homePrice:Double
    var homeWeight:String?
    var homeOrigin:String
    var homeDescription:String
    
    init(homeImage:String, homeTittle:String, homePrice: Double, homeWeight:String?, homeOrigin: String, homeDescription:String, homeItemsLeft: Int) {
        self.homeImage = homeImage
        self.homeTittle = homeTittle
        self.homePrice = homePrice
        self.homeWeight = homeWeight
        self.homeOrigin = homeOrigin
        self.homeDescription = homeDescription
        self.homeItemsLeft = homeItemsLeft
    }
}
