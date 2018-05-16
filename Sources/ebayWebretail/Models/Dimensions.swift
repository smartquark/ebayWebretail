//
//  Dimensions.swift
//  ebayWebretail
//
//  Created by Gerardo Grisolini on 15/05/18.
//

import Foundation

public enum LengthUnitOfMeasure: String, Codable {
    case inch = "INCH"
    case feet = "FEET"
    case centimeter = "CENTIMETER"
    case meter = "METER"
}

public struct Dimensions : Codable {
    let unit : LengthUnitOfMeasure
    let width : Int
	let height : Int
	let length : Int

	enum CodingKeys: String, CodingKey {
		case height = "height"
		case length = "length"
		case unit = "unit"
		case width = "width"
	}

    public init(unit: LengthUnitOfMeasure, width: Int, height: Int, length: Int) {
        self.unit = unit
        self.width = width
        self.height = height
        self.length = length
    }

    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		height = try values.decode(Int.self, forKey: .height)
		length = try values.decode(Int.self, forKey: .length)
		unit = try values.decode(LengthUnitOfMeasure.self, forKey: .unit)
		width = try values.decode(Int.self, forKey: .width)
	}

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(height, forKey: .height)
        try container.encode(length, forKey: .length)
        try container.encode(unit, forKey: .unit)
        try container.encode(width, forKey: .width)
    }
}
