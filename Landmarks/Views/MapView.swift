//
//  MapView.swift
//  Landmarks
//
//  Created by 欧天逸 on 2022/10/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    //
    @State private var region = MKCoordinateRegion(
        // Here's a tricky question, the original coordinates seems unworkable on this method,
        // So I switch the coordinates on website: https://codewithchris.com/swiftui/swiftui-mapkit/
        center: CLLocationCoordinate2D(latitude: 37.789467, longitude: -122.416772),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    
    var body: some View {
        Map(coordinateRegion: $region)
//        Text("hello")
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011286, longitude: -116.166868))
    }
}
