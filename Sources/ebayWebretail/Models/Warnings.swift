//
//  Warnings.swift
//  ebayWebretail
//
//  Created by Gerardo Grisolini on 15/05/18.
//

import Foundation

public struct Warnings : Codable {
	let errorId : String?
	let domain : String?
	let subdomain : String?
	let category : String?
	let message : String?
	let parameters : [Parameters]?
	let longMessage : String?
	let inputRefIds : [String]?
	let outputRefIds : [String]?

	enum CodingKeys: String, CodingKey {

		case errorId = "errorId"
		case domain = "domain"
		case subdomain = "subdomain"
		case category = "category"
		case message = "message"
		case parameters = "parameters"
		case longMessage = "longMessage"
		case inputRefIds = "inputRefIds"
		case outputRefIds = "outputRefIds"
	}

    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		errorId = try values.decodeIfPresent(String.self, forKey: .errorId)
		domain = try values.decodeIfPresent(String.self, forKey: .domain)
		subdomain = try values.decodeIfPresent(String.self, forKey: .subdomain)
		category = try values.decodeIfPresent(String.self, forKey: .category)
		message = try values.decodeIfPresent(String.self, forKey: .message)
		parameters = try values.decodeIfPresent([Parameters].self, forKey: .parameters)
		longMessage = try values.decodeIfPresent(String.self, forKey: .longMessage)
		inputRefIds = try values.decodeIfPresent([String].self, forKey: .inputRefIds)
		outputRefIds = try values.decodeIfPresent([String].self, forKey: .outputRefIds)
	}
}
