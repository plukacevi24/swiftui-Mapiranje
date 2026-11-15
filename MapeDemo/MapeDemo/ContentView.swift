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
    var body: some View {
        Map() {
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
    }
}
#Preview{
    ContentView()
}

