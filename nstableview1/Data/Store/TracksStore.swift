//
//  TracksStore.swift
//  nstableview1
//
//  Created by Marcus Ziadé on 13.3.2021.
//

import Foundation

class TracksStore {

    func getTracks(completion: @escaping (([Track]) -> Void)) {
        let decoded = Bundle.main.decode(TracksResponse.self, from: "posty.json")
        completion(decoded.tracks)
    }
}
