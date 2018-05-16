//
//  Price.swift
//  ebayWebretail
//
//  Created by Gerardo Grisolini on 15/05/18.
//

import Foundation

public struct Price : Codable {
	let currency : String
	let value : Double

	enum CodingKeys: String, CodingKey {
		case currency = "currency"
		case value = "value"
	}

    public init(currency: String, value: Double) {
        self.currency = currency
        self.value = value
    }
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		currency = try values.decode(String.self, forKey: .currency)
		value = try values.decode(Double.self, forKey: .value)
	}

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(currency, forKey: .currency)
        try container.encode(value, forKey: .value)
    }
}
