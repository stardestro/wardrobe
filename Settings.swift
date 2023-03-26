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
    @Binding var maxtemp: Double
    @Binding var mintemp: Double
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
                        Slider(value: $maxtemp, in: 0...100, step: 5)
                        Text("Max: \(maxtemp, specifier: "%.0f")")
                        Slider(value: $mintemp, in: 0...100, step: 5)
                        Text("Min: \(mintemp, specifier: "%.0f")")
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

/*
struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}*/


