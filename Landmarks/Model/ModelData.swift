//
//  ModelData.swift
//  Landmarks
//
//  This file is used to initialize data in the certain file
//
//  Created by 欧天逸 on 2022/10/25.
//

import Foundation

// The variable saves an array of data decoded in json file named below, to make sure no mistyping, copy or passsins by variables is suggested.
var landmarks: [Landmark] = load("landmarkData.json")  // Causion: there's no need to write the full path

// This func shows how to get data safely, all the operations are done under guard or try-catch
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")  // What is mainbundle?
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle: \n \(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self): \n \(error)")
    }
}
