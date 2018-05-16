//
//  FulfillmentTime.swift
//  ebayWebretail
//
//  Created by Gerardo Grisolini on 15/05/18.
//

import Foundation

public enum TimeDurationUnit: String, Codable {
    case year = "YEAR"
    case month = "MONTH"
    case day = "DAY"
    case hour = "HOUR"
    case calendarDay = "CALENDAR_DAY"
    case businessDay = "BUSINESS_DAY"
    case minute = "MINUTE"
    case second = "SECOND"
    case millisecond = "MILLISECOND"
}

public struct FulfillmentTime : Codable {
	let unit : TimeDurationUnit
	let value : Int

	enum CodingKeys: String, CodingKey {
		case unit = "unit"
		case value = "value"
	}

    public init(unit: TimeDurationUnit, value: Int) {
        self.unit = unit
        self.value = value
    }

    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		unit = try values.decode(TimeDurationUnit.self, forKey: .unit)
		value = try values.decode(Int.self, forKey: .value)
	}

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(unit, forKey: .unit)
        try container.encodeIfPresent(value, forKey: .value)
    }
}
