//
//  Specifications.swift
//  ebayWebretail
//
//  Created by Gerardo Grisolini on 15/05/18.
//

import Foundation

public struct Specifications : Codable {
	let name : String
	let values : [String]

	enum CodingKeys: String, CodingKey {
		case name = "name"
		case values = "values"
	}

    public init(name: String, values: [String]) {
        self.name = name
        self.values = values
    }

    public init(from decoder: Decoder) throws {
		let data = try decoder.container(keyedBy: CodingKeys.self)
		name = try data.decode(String.self, forKey: .name)
		values = try data.decode([String].self, forKey: .values)
	}

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(values, forKey: .values)
    }
}
