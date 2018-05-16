//
//  OfferFeed.swift
//  ebayWebretail
//
//  Created by Gerardo Grisolini on 15/05/18.
//

import Foundation

public struct OfferFeed : Feed {
	var sku : String?
	var marketplaceId : String?
	var format : String?
	var availableQuantity : Int?
	var categoryId : Int?
	var listingDescription : String?
	var listingPolicies : ListingPolicies?
	var pricingSummary : PricingSummary?
	var quantityLimitPerBuyer : Int?

	enum CodingKeys: String, CodingKey {
		case sku = "sku"
		case marketplaceId = "marketplaceId"
		case format = "format"
		case availableQuantity = "availableQuantity"
		case categoryId = "categoryId"
		case listingDescription = "listingDescription"
		case listingPolicies
		case pricingSummary
		case quantityLimitPerBuyer = "quantityLimitPerBuyer"
	}

    public init() { }
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		sku = try values.decodeIfPresent(String.self, forKey: .sku)
		marketplaceId = try values.decodeIfPresent(String.self, forKey: .marketplaceId)
		format = try values.decodeIfPresent(String.self, forKey: .format)
		availableQuantity = try values.decodeIfPresent(Int.self, forKey: .availableQuantity)
		categoryId = try values.decodeIfPresent(Int.self, forKey: .categoryId)
		listingDescription = try values.decodeIfPresent(String.self, forKey: .listingDescription)
		listingPolicies = try ListingPolicies(from: decoder)
		pricingSummary = try PricingSummary(from: decoder)
		quantityLimitPerBuyer = try values.decodeIfPresent(Int.self, forKey: .quantityLimitPerBuyer)
	}

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(sku, forKey: .sku)
        try container.encodeIfPresent(marketplaceId, forKey: .marketplaceId)
        try container.encodeIfPresent(format, forKey: .format)
        try container.encodeIfPresent(availableQuantity, forKey: .availableQuantity)
        try container.encodeIfPresent(categoryId, forKey: .categoryId)
        try container.encodeIfPresent(listingDescription, forKey: .listingDescription)
        try container.encodeIfPresent(listingPolicies, forKey: .listingPolicies)
        try container.encodeIfPresent(pricingSummary, forKey: .pricingSummary)
        try container.encodeIfPresent(quantityLimitPerBuyer, forKey: .quantityLimitPerBuyer)
    }

    public func method() -> String {
        return "POST"
    }
    
    public func url(endpoint: Endpoint, sku: String) -> String {
        return "https://\(endpoint.rawValue)/sell/inventory/v1/offer"
    }
    
    public func Data() -> Data {
        return try! JSONEncoder().encode(self)
    }
}
