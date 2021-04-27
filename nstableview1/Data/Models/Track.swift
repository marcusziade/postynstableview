//
//  Track.swift
//  nstableview1
//
//  Created by Marcus Ziadé on 13.3.2021.
//

import Foundation

struct TracksResponse: Codable {

    // MARK: - Properties

    let tracks: [Track]
}

struct Track: Codable, Identifiable {

    // MARK: - Types

    enum CodingKeys: String, CodingKey {
        case id = "serviceId"
        case track = "track"
        case album = "album"
    }

    // MARK: - Properties

    let id: String
    let track: String
    let album: String
}
