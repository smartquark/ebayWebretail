//
//  Feed.swift
//  ebayWebretail
//
//  Created by Gerardo Grisolini on 15/05/18.
//

import Foundation

public enum Condition: String, Codable {
    case new = "NEW"
    case likeNew = "LIKE_NEW"
    case newOther = "NEW_OTHER"
    case newWithDefects = "NEW_WITH_DEFECTS"
    case manufacturerRefurbished = "MANUFACTURER_REFURBISHED"
    case sellerRefurbished = "SELLER_REFURBISHED"
    case usedExcellent = "USED_EXCELLENT"
    case usedVeryGood = "USED_VERY_GOOD"
    case usedGood = "USED_GOOD"
    case usedAccetable = "USED_ACCEPTABLE"
    case forPartsOrNotWorking = "FOR_PARTS_OR_NOT_WORKING"
}

public struct ProductFeed: Feed {
	let availability : Availability
	let condition : Condition
	var conditionDescription : String?
	var packageWeightAndSize : PackageWeightAndSize?
	let product : Product
	var sku : String?
	var groupIds : [String]?

	enum CodingKeys: String, CodingKey {

		case availability
		case condition = "condition"
		case conditionDescription = "conditionDescription"
		case packageWeightAndSize
		case product
		case sku = "sku"
		case groupIds = "groupIds"
	}

    public init(availability: Availability, condition: Condition, product: Product) {
        self.availability = availability
        self.condition = condition
        self.product = product
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
		availability = try Availability(from: decoder)
		condition = try values.decode(Condition.self, forKey: .condition)
		conditionDescription = try values.decodeIfPresent(String.self, forKey: .conditionDescription)
		packageWeightAndSize = try PackageWeightAndSize(from: decoder)
		product = try Product(from: decoder)
		sku = try values.decodeIfPresent(String.self, forKey: .sku)
		groupIds = try values.decodeIfPresent([String].self, forKey: .groupIds)
	}

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(availability, forKey: .availability)
        try container.encode(condition, forKey: .condition)
        try container.encodeIfPresent(conditionDescription, forKey: .conditionDescription)
        try container.encodeIfPresent(packageWeightAndSize, forKey: .packageWeightAndSize)
        try container.encode(product, forKey: .product)
        try container.encodeIfPresent(sku, forKey: .sku)
        try container.encodeIfPresent(groupIds, forKey: .groupIds)
    }

    public func method() -> String {
        return "PUT"
    }
    
    public func url(endpoint: Endpoint, sku: String) -> String {
        return "https://\(endpoint.rawValue)/sell/inventory/v1/inventory_item/\(sku)"
    }
    
    public func Data() -> Data {
        return try! JSONEncoder().encode(self)
    }
}
