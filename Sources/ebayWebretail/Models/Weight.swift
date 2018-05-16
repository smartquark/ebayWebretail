//
//  Weight.swift
//  ebayWebretail
//
//  Created by Gerardo Grisolini on 15/05/18.
//

import Foundation

public enum WeightUnitOfMeasure: String, Codable {
    case pound = "POUND"
    case kilogram = "KILOGRAM"
    case ounce = "OUNCE"
    case gram = "GRAM"
}

public struct Weight : Codable {
	let unit : WeightUnitOfMeasure
	let value : Int

	enum CodingKeys: String, CodingKey {
		case unit = "unit"
		case value = "value"
	}

    public init(unit: WeightUnitOfMeasure, value: Int) {
        self.unit = unit
        self.value = value
    }
    
    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		unit = try values.decode(WeightUnitOfMeasure.self, forKey: .unit)
		value = try values.decode(Int.self, forKey: .value)
	}

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(unit, forKey: .unit)
        try container.encode(value, forKey: .value)
    }
}
