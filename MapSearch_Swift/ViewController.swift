//
//  ViewController.swift
//  MapSearch_Swift
//
//  Created by Rama Chandra on 10/10/2014.
//  Copyright (c) 2014 Rama Chandra. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mapView: MKMapView!
    
    func searchBarSearchButtonClicked(sender:UISearchBar)
    {
        self.searchBar.resignFirstResponder()
        
        var geocoder=CLGeocoder()
        
        geocoder.geocodeAddressString(searchBar.text, completionHandler:
            { (placemarks, error) -> Void in
                
            if (error != nil) {
                println("failed with error" + error.localizedDescription)
                        return
                    }

            
            var placemark:CLPlacemark=placemarks[0] as CLPlacemark
           var location:CLLocationCoordinate2D=placemark.location.coordinate
            
            var annoation=MKPointAnnotation()
            annoation.coordinate=location
            annoation.title=self.searchBar.text
            self.mapView.addAnnotation(annoation)
            
            var mr:MKMapRect=self.mapView.visibleMapRect
            var pt:MKMapPoint=MKMapPointForCoordinate(annoation.coordinate)
            mr.origin.x=pt.x-mr.size.width*0.5
            mr.origin.y=pt.y-mr.size.height*0.25
            
            self.mapView.setVisibleMapRect(mr, animated: true)
            
        })
        
       
       /* geocoder.geocodeAddressString(searchBar.text, completionHandler:
            { (placeMarks:[]!, error:NSError!) -> Void in
            
                var placeMark:CLPlacemark=placeMarks[0] as CLPlacemark
                var region:MKCoordinateRegion
                var location:CLLocationCoordinate2D=placeMark.location.coordinate
               
                //region.center=placeMark.region
                
                var annoation=MKPointAnnotation()
                annoation.coordinate=location
                annoation.title=self.searchBar.text
                self.mapView.addAnnotation(annoation)
                
                var mr:MKMapRect=self.mapView.visibleMapRect
                var pt:MKMapPoint=MKMapPointForCoordinate(annoation.coordinate)
                mr.origin.x=pt.x-mr.size.width*0.5
                mr.origin.y=pt.y-mr.size.height*0.25
                
                self.mapView.setVisibleMapRect(mr, animated: true)
                
                
                
                
                
                
                
        })*/
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

