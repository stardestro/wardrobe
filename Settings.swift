import SwiftUI
import CoreLocation
import CoreLocationUI

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestLocation() {
        locationManager.requestLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.first else {
            // show an error
            return
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

struct Settings: View {
    @StateObject var locationManager = LocationManager()
    @State private var days = 1
    
    var body: some View {
        NavigationView {
            Form {
                Section("Location") {
                    VStack {
                        if let location = locationManager.location {
                            Text("Your location: \(location.latitude), \(location.longitude)")
                        }
                        
                        LocationButton {
                            locationManager.requestLocation()
                            print("")
                        }
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .labelStyle(.titleAndIcon)
                        .symbolVariant(.fill)
                    }
                }
                Section("Clothing") {
                    Stepper{
                        Text("Wait \(days) days before reusing clothes")
                    } onIncrement: {
                        if (days <= 13) {
                            days += 1
                        } else {
                            days = 14
                        }
                    } onDecrement: {
                        if (days != 0) {
                            days -= 1
                        } else {
                            days = 0
                        }
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
