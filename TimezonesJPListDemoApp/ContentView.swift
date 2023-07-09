//
//  ContentView.swift
//  TimezonesJPListDemoApp
//
//  Created by JotaroSugiyama on 2023/07/09.
//

import SwiftUI

struct ContentView: View {
    @State var timeZoneSections: [TimeZoneSection]? = nil

    var body: some View {
        Group {
            if let timeZoneSections = timeZoneSections {
                SimpleTimeZoneListView(timeZoneSections: timeZoneSections)
            } else {
                Text("Loading...")
            }
        }.onAppear {
            loadTimeZones { loadedTimeZoneSections in
                self.timeZoneSections = loadedTimeZoneSections
            }
        }
    }
    
    func loadTimeZones(completion: @escaping ([TimeZoneSection]?) -> Void) {
        let url = URL(string: "https://sugijotaro.github.io/TimezonesJP/timezones.json")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                if let timeZones = try? decoder.decode([TimeZoneSection].self, from: data) {
                    DispatchQueue.main.async {
                        completion(timeZones)
                    }
                } else {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
