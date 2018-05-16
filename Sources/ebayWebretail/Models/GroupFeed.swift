//
//  GroupFeed.swift
//  ebayWebretail
//
//  Created by Gerardo Grisolini on 15/05/18.
//

import Foundation

public struct GroupFeed : Feed {
	var aspects : [String]?
	var title : String?
	var description : String?
	var imageUrls : [String]?
	var variantSKUs : [String]?
	var variesBy : VariesBy?

	enum CodingKeys: String, CodingKey {
		case aspects = "aspects"
		case title = "title"
		case description = "description"
		case imageUrls = "imageUrls"
		case variantSKUs = "variantSKUs"
		case variesBy
	}

    public init() { }

	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		aspects = try values.decodeIfPresent([String].self, forKey: .aspects)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		imageUrls = try values.decodeIfPresent([String].self, forKey: .imageUrls)
		variantSKUs = try values.decodeIfPresent([String].self, forKey: .variantSKUs)
		variesBy = try VariesBy(from: decoder)
	}

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(aspects, forKey: .aspects)
        try container.encode(title, forKey: .title)
        try container.encode(description, forKey: .description)
        try container.encode(imageUrls, forKey: .imageUrls)
        try container.encode(variantSKUs, forKey: .variantSKUs)
        try container.encode(variesBy, forKey: .variesBy)
    }

    public func method() -> String {
        return "PUT"
    }
    
    public func url(endpoint: Endpoint, sku: String) -> String {
        return "https://\(endpoint.rawValue)/sell/inventory/v1/inventory_item_group/\(sku)"
    }
    
    public func Data() -> Data {
        return try! JSONEncoder().encode(self)
    }
}
