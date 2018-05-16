//
//  Product.swift
//  ebayWebretail
//
//  Created by Gerardo Grisolini on 15/05/18.
//

import Foundation

public struct Product : Codable {
    var aspects : Dictionary<String, [String]>?
	var brand : String?
	var description : String?
	var imageUrls : [String]?
	var mpn : String?
	var subtitle : String?
	var title : String?
	var isbn : [String]?
	var upc : [String]?
	var ean : [String]?
	var epid : String?

	enum CodingKeys: String, CodingKey {
		case aspects = "aspects"
		case brand = "brand"
		case description = "description"
		case imageUrls = "imageUrls"
		case mpn = "mpn"
		case subtitle = "subtitle"
		case title = "title"
		case isbn = "isbn"
		case upc = "upc"
		case ean = "ean"
		case epid = "epid"
	}

    public init() { }

    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		aspects = try values.decodeIfPresent(Dictionary<String, [String]>.self, forKey: .aspects)
		brand = try values.decodeIfPresent(String.self, forKey: .brand)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		imageUrls = try values.decodeIfPresent([String].self, forKey: .imageUrls)
		mpn = try values.decodeIfPresent(String.self, forKey: .mpn)
		subtitle = try values.decodeIfPresent(String.self, forKey: .subtitle)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		isbn = try values.decodeIfPresent([String].self, forKey: .isbn)
		upc = try values.decodeIfPresent([String].self, forKey: .upc)
		ean = try values.decodeIfPresent([String].self, forKey: .ean)
		epid = try values.decodeIfPresent(String.self, forKey: .epid)
	}
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(aspects, forKey: .aspects)
        try container.encodeIfPresent(brand, forKey: .brand)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(imageUrls, forKey: .imageUrls)
        try container.encodeIfPresent(mpn, forKey: .mpn)
        try container.encodeIfPresent(subtitle, forKey: .subtitle)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(isbn, forKey: .isbn)
        try container.encodeIfPresent(upc, forKey: .upc)
        try container.encodeIfPresent(ean, forKey: .ean)
        try container.encodeIfPresent(epid, forKey: .epid)
    }
}
