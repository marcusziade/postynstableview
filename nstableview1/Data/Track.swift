//
//  Track.swift
//  nstableview1
//
//  Created by Marcus Ziadé on 13.3.2021.
//

import Foundation

struct TracksResponse: Codable {

    let tracks: [Track]
}

struct Track: Codable, Identifiable {

    enum CodingKeys: String, CodingKey {
        case id = "serviceId"
        case track = "track"
        case album = "album"
    }

    let id: String
    let track: String
    let album: String
}
