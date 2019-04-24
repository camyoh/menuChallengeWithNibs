//
//  EventsModel.swift
//  menuChallengeWithNibs
//
//  Created by Carlos Mendieta on 4/23/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import Foundation

struct Events: Codable {
    let events: [Event]
}

struct Event: Codable {
    let name: String
    let description: String?
    let image: String
}
