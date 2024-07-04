import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    let locationManager = CLLocationManager()
    private var mapView: MKMapView!
    
    private lazy var currentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "current"), for: .normal)
        button.addTarget(self, action: #selector(currentfetch), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        

    }
    
    //MARK: - 현재 위치를 반환해줌
    @objc func currentfetch() {
        
    }
    
    //MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
    }
}
