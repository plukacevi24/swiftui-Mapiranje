//
//  ContentView.swift
//  MapeDemo
//
//  Created by foi on 15.11.2026..
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D{
    static let foi = CLLocationCoordinate2D(latitude: 46.3077, longitude: 16.3381)
    static let stariGrad = CLLocationCoordinate2D(latitude: 46.3105, longitude: 16.3348)
}

struct ContentView: View {
    
    @State private var LocationManager = CLLocationManager()
    var body: some View {
        Map() {
            
            UserAnnotation()
            
            Marker ("FOI",systemImage: "graduationcap.fill" ,coordinate: .foi)
                .tint(.blue)
            
            Annotation("Stari grad", coordinate: .stariGrad) {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.background)
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.secondary, lineWidth: 5)
                    Image (systemName: "building.columns")
                        .padding(5)
                }
            }
            .annotationTitles(.hidden)
            
        }
        //Kontrola mape
        .mapControls {
            MapUserLocationButton() // gumb za prikaz naše lokacije
            MapCompass() // kompas kad se rotira po karti
            MapScaleView() // mjerilo kad se zumira ili odzumira
        }
        .onAppear {
            LocationManager.requestWhenInUseAuthorization()
        }
    }
}
#Preview{
    ContentView()
}

