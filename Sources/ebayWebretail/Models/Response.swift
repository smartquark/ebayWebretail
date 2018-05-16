//
//  Response.swift
//  ebayWebretail
//
//  Created by Gerardo Grisolini on 15/05/18.
//

import Foundation

struct Response : Codable {
	let warnings : [Warnings]?

	enum CodingKeys: String, CodingKey {

		case warnings = "warnings"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		warnings = try values.decodeIfPresent([Warnings].self, forKey: .warnings)
	}
}
