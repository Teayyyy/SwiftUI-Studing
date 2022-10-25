//
//  Landmark.swift
//  Landmarks
//  This file shows the data structure of Landmarks
//
//
//  Created by 欧天逸 on 2022/10/25.
//

import Foundation
import SwiftUI
import CoreLocation  // Usage: CLLocationCoordinate2D


// The Identifiable protocol needs an id, which is aready exists in property, and needs a decode
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    // Why privare? Because this variable don't need to exhibit in the view.
    private var imageName: String
    
    var image: Image {
        // Get the image by its name
        Image(imageName)
    }
    
    // Set a coordinate property, and it's made by a struct, contains Longtitude and Latitude /
    // which reflected the structure in json file
    private var coordinates: Coordinates  // This property is private because it onlu be used to generate another property below:
    
    var locationCoordinate: CLLocationCoordinate2D {
        // This computation needs the 'coordinate' property, and that needs the 'Coordinates' property(struct)
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
