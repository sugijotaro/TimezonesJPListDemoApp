//
//  Model.swift
//  TimezonesJPListDemoApp
//
//  Created by JotaroSugiyama on 2023/07/09.
//

import Foundation

struct TimeZoneSection: Codable {
    let region: String
    let region_ja: String
    let cities: [City]
    
    struct City: Codable, Hashable {
        let timezone: String
        let city: String
        let country: String
        let city_ja: String
        let country_ja: String
    }
}
