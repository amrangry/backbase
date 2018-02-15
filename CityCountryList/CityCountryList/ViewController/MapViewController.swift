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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
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
        
        
        
        
        cityLabel.text = cityInfo?.name// + ", " + cityInfo.country
        
        guard let country = cityInfo?.country  else {
            return
        }
        countryLabel.text = ", " + country
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
     // MARK: - IBOutlet
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
