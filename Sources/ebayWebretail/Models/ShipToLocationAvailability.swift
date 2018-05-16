//
//  ShipToLocationAvailability.swift
//  ebayWebretail
//
//  Created by Gerardo Grisolini on 15/05/18.
//

import Foundation

public struct ShipToLocationAvailability : Codable {
	let quantity : Int

	enum CodingKeys: String, CodingKey {

		case quantity = "quantity"
	}

    public init(quantity: Int) {
        self.quantity = quantity
    }
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		quantity = try values.decode(Int.self, forKey: .quantity)
	}

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(quantity, forKey: .quantity)
    }
}
