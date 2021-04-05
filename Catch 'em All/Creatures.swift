//
//  Creatures.swift
//  Catch 'em All
//
//  Created by Gigi Kranjc on 2021-04-05.
//

import Foundation
class Creatures {
    private struct Returned: Codable {
        var count: Int
        var next: String?
        var results: [Creature]
    }
    
    struct Creature: Codable {
        var name = ""
        var url = ""
    }
    
    var count = 0
    var urlString = "https://pokeapi.co/api/v2/pokemon/"
    var creatureArray: [Creature] = []
    
    func getData(completed: @escaping () -> ()) {
        print("🌎 we are acceessing the url: \(urlString)")
        
        //create a URL
        guard let url = URL(string: urlString) else {
            print("😡 ERROR: could not create a URL from \(urlString)")
            completed()
            return
        }
        
        //create a session
        let session = URLSession.shared
        
        //get data with .dataTask Method
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("😡 ERROR: \(error.localizedDescription)")
            }
            // note: there ar some additional things that could go wrong when using URLSssion, but we shouldn't experience them, so we'll ignore testing for these for now...
            
            // deal with the data
            do {
                let returned = try JSONDecoder().decode(Returned.self, from: data!)
                self.count = returned.count
                self.urlString = returned.next ?? ""
                self.creatureArray = returned.results
                
            }catch{
                print("😡 JSON ERROR: \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()
    }
    
}



