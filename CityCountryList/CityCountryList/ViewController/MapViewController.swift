//
//  MapViewController.swift
//  CityCountryList
//
//  Created by Amr ELghadban on 2/15/18.
//  Copyright © 2018 Amr ELghadban. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: BaseViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    // MARK: - Varibles
    var cityInfo :CityModel?
    
    // MARK: - ViewController LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // set initial location for Awoon
        let location = CLLocation(latitude: (cityInfo?.coord.lat)!, longitude: (cityInfo?.coord.lon)!)
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location.coordinate
        mapView.addAnnotation(annotation as MKAnnotation)
        cityLabel.text = cityInfo?.name
        
        guard let country = cityInfo?.country  else {
            return
        }
        countryLabel.text = ", " + country
  }

     // MARK: - IBOutlet
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
