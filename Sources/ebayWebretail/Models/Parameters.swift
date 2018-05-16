//
//  Parameters.swift
//  ebayWebretail
//
//  Created by Gerardo Grisolini on 15/05/18.
//

import Foundation

struct Parameters : Codable {
	let value : String
	let name : String

	enum CodingKeys: String, CodingKey {
		case value = "value"
		case name = "name"
	}

    public init(name: String, value: String) {
        self.name = name
        self.value = value
    }

    init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		value = try values.decode(String.self, forKey: .value)
		name = try values.decode(String.self, forKey: .name)
	}

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(value, forKey: .value)
    }
}
