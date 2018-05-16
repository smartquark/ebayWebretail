//
//  Availability.swift
//  ebayWebretail
//
//  Created by Gerardo Grisolini on 15/05/18.
//

import Foundation

public struct Availability : Codable {
	var pickupAtLocationAvailability : [PickupAtLocationAvailability]?
	var shipToLocationAvailability : ShipToLocationAvailability?

	enum CodingKeys: String, CodingKey {
		case pickupAtLocationAvailability = "pickupAtLocationAvailability"
		case shipToLocationAvailability
	}

    public init() { }

    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		pickupAtLocationAvailability = try values.decodeIfPresent([PickupAtLocationAvailability].self, forKey: .pickupAtLocationAvailability)
		shipToLocationAvailability = try ShipToLocationAvailability(from: decoder)
	}

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(pickupAtLocationAvailability, forKey: .pickupAtLocationAvailability)
        try container.encodeIfPresent(shipToLocationAvailability, forKey: .shipToLocationAvailability)
    }
}
