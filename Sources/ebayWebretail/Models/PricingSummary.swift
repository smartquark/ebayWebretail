//
//  PricingSummary.swift
//  ebayWebretail
//
//  Created by Gerardo Grisolini on 15/05/18.
//

import Foundation

public struct PricingSummary : Codable {
	let price : Price

    enum CodingKeys: String, CodingKey {
        case price
    }

    public init(price: Price) {
        self.price = price
    }

    public init(from decoder: Decoder) throws {
		price = try Price(from: decoder)
	}

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(price, forKey: .price)
    }
}
