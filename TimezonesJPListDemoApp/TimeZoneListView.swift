//
//  TimeZoneListView.swift
//  TimezonesJPListDemoApp
//
//  Created by JotaroSugiyama on 2023/07/09.
//

import SwiftUI

struct SimpleTimeZoneListView: View {
    var timeZoneSections: [TimeZoneSection]
    @State private var searchText = ""

    var body: some View {
        VStack {
            TextField("検索", text: $searchText)
                .padding(.vertical, 10)
                .padding(.leading, 10)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
                .padding(.horizontal)
            List {
                ForEach(timeZoneSections, id: \.region) { section in
                    let filteredCities = section.cities.filter({ searchText.isEmpty ? true : $0.city_ja.contains(searchText) || $0.country_ja.contains(searchText) })
                    if !filteredCities.isEmpty {
                        Section(header: Text(section.region_ja)) {
                            ForEach(filteredCities.sorted(by: { $0.city_ja < $1.city_ja }), id: \.self) { city in
                                Text("\(city.city_ja)、\(city.country_ja)")
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}
