//
//  PickupAtLocationAvailability.swift
//  ebayWebretail
//
//  Created by Gerardo Grisolini on 15/05/18.
//

import Foundation

public enum AvailabilityType: String, Codable {
    case inStock = "IN_STOCK"
    case outOfStock = "OUT_OF_STOCK"
    case shipToStore = "SHIP_TO_STORE"
}

public struct PickupAtLocationAvailability : Codable {
	var availabilityType : AvailabilityType?
	var fulfillmentTime : FulfillmentTime?
	var merchantLocationKey : String?
	var quantity : Int

	enum CodingKeys: String, CodingKey {
		case availabilityType = "availabilityType"
		case fulfillmentTime
		case merchantLocationKey = "merchantLocationKey"
		case quantity = "quantity"
	}

    public init(quantity: Int) {
        self.quantity = quantity
    }

    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		availabilityType = try values.decode(AvailabilityType.self, forKey: .availabilityType)
		fulfillmentTime = try FulfillmentTime(from: decoder)
		merchantLocationKey = try values.decode(String.self, forKey: .merchantLocationKey)
		quantity = try values.decode(Int.self, forKey: .quantity)
	}

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(availabilityType, forKey: .availabilityType)
        try container.encodeIfPresent(fulfillmentTime, forKey: .fulfillmentTime)
        try container.encodeIfPresent(merchantLocationKey, forKey: .merchantLocationKey)
        try container.encodeIfPresent(quantity, forKey: .quantity)
    }
}
