//
//  compassDat.swift
//  AirDat
//
//  Created by Yacov Daki on 11/25/26.
//

import Foundation
import CoreLocation
import Observation

@Observable
class compassManager: NSObject, CLLocationManagerDelegate{
    var magneticHeading: Double = 0.0
    var trueHeading: Double = 0.0
    
    private let locationManager = CLLocationManager()
    ///begins authorization to use locatrion
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        startUpdating()
    }
    /// updates the location and heading
    func startUpdating(){
        if CLLocationManager.headingAvailable(){
            locationManager.headingFilter = 1
            locationManager.startUpdatingHeading()
            locationManager.startUpdatingLocation()
        }
    }
    //gets magnetic heading
    var mgHeadingFormatted: String{
        let rounded = Int(magneticHeading.rounded()) % 360
        return String(format: "%03d", rounded)
    }
    //converts magnetic heading into rwy num by divving by 10 and rounding
    var rwyHeading: String{
        var rwy = Int((magneticHeading / 10.0).rounded())
        
        if rwy == 0 || rwy == 36 {
            rwy = 36
        }
        
        return String(format: "%02d", rwy)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading NewHeading: CLHeading) {
        magneticHeading = NewHeading.magneticHeading
        trueHeading = NewHeading.trueHeading >= 0 ? NewHeading.trueHeading : NewHeading.magneticHeading
    }
}
