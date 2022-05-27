//
//  ViewController.swift
//  08.MapView
//
//  Created by 유준용 on 2022/05/13.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    //MARK: - Property
    let locationManager = CLLocationManager()
    
    //MARK: - UI Components
    @IBOutlet weak var segControl: UISegmentedControl!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var uppperLabel: UILabel!
    @IBOutlet weak var lowerLabel: UILabel!
    
    //MARK: - Event Method
    @IBAction func segValueChanged(_ sender: UISegmentedControl) {
        let segValue = sender.selectedSegmentIndex
        switch segValue {
        case 0:
            locationManager.startUpdatingLocation()
        case 1:
            self.lowerLabel.text = "서울 구로디지털단지역"
            setAnnotation(latitudeValue: 37.485006, longitudeValue: 126.900749, delta: 0.1, title: "구.디.역", subtitle: "구디역")
        case 2:
            self.lowerLabel.text = "프랑스 파리 루브르 박물관"
            setAnnotation(latitudeValue: 48.8653836669445, longitudeValue: 2.3401666935081864, delta: 0.1, title: "루브르 박물관", subtitle: "루브르 박물관")
        default: return
        }
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        uppperLabel.text = ""
        lowerLabel.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
    }
    
    //MARK: - MapKit Method
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double)->CLLocationCoordinate2D{
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        mapView.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!) { (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            self.uppperLabel.text = "현재 위치"
            self.lowerLabel.text = address
        }
        locationManager.stopUpdatingLocation()
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double, title strTitle: String, subtitle strSubtitle: String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        mapView.addAnnotation(annotation)
    }
}

    //MARK: - Delegate
extension ViewController: CLLocationManagerDelegate{
}
