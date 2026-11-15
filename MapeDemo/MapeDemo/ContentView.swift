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
    
    @State private var odabrano: String?
    
    let podrucjeStarogGrada = [
        CLLocationCoordinate2D(latitude: 46.3111, longitude: 16.3339),
        CLLocationCoordinate2D(latitude: 46.3111, longitude: 16.3357),
        CLLocationCoordinate2D(latitude: 46.3099, longitude: 16.3357),
        CLLocationCoordinate2D(latitude: 46.3099, longitude: 16.3339)
    ]
    
    var body: some View {
        Map(selection: $odabrano) {
            
            MapCircle(center: .foi, radius: 150)
                .foregroundStyle(.blue.opacity(0.2))
                .stroke(.blue, lineWidth: 2)
            
            MapPolygon(coordinates: podrucjeStarogGrada)
                .foregroundStyle(.green.opacity(0.3))
                .stroke(.green, lineWidth: 2)
            
            MapPolyline(coordinates: [.foi, .stariGrad])
                .stroke(.red, lineWidth: 4)

            UserAnnotation()
            
            Marker ("FOI",systemImage: "graduationcap.fill" ,coordinate: .foi)
                .tint(.blue)
                .tag("FOI")
            
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
            .tag("Stari grad")
            
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
        .safeAreaInset(edge: .bottom) {
            if let odabrano {
                VStack(alignment: .leading, spacing: 4) {
                    Text(odabrano)
                        .font(.headline)
                    Text(opis(naziv: odabrano))
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
            }
        }
    }
        func opis(naziv: String) -> String {
            switch naziv {
            case "FOI":
                return "Fakultet organizacije i informatike, Pavlinska 2, varaždin"
            case "Stari grad":
                return "Srednjovjekovna utvrda, dio Gradskog muzeja Varaždin"
            default:
                return ""
            
        }
    }
}
#Preview{
    ContentView()
}

