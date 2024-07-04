import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    
    private var mapView: MKMapView!
    
    private lazy var currentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "current"), for: .normal)
        button.addTarget(self, action: #selector(currentfetch), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization() //앱을 사용하는동안 사용자에게 위치서비스의 권한을 요청
        locationManager.delegate = self
        locationManager.startUpdatingLocation() //사용자에게 현재위치를 알려줌
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        mapView = MKMapView(frame: self.view.bounds)
        mapView.delegate = self
        self.view.addSubview(mapView)
        
        self.view.addSubview(currentButton)
        currentButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            currentButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            currentButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            currentButton.widthAnchor.constraint(equalToConstant: 50),
            currentButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        mapView.showsUserLocation = true
        
    }
    
    //MARK: - 현재 위치를 반환해줌
    @objc func currentfetch() {
        if let location = currentLocation {
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
            mapView.setRegion(region, animated: true) //원하는 지역을 뜨워줌
        }
    }
    
    //MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            currentLocation = location
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
}
