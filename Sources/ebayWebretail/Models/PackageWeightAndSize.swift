//
//  PackageWeightAndSize.swift
//  ebayWebretail
//
//  Created by Gerardo Grisolini on 15/05/18.
//

import Foundation

public enum PackageType: String, Codable {
    case letter = "LETTER"
    case bulkyGoods = "BULKY_GOODS"
    case caravan = "CARAVAN"
    case cars = "CARS"
    case europallet = "EUROPALLET"
    case expandableToughBags = "EXPANDABLE_TOUGH_BAGS"
    case extraLargePack = "EXTRA_LARGE_PACK"
    case forniture = "FURNITURE"
    case industryVehicles = "INDUSTRY_VEHICLES"
    case largeCanadaPostbox = "LARGE_CANADA_POSTBOX"
    case largeCanadaPostBubbleMailer = "LARGE_CANADA_POST_BUBBLE_MAILER"
    case largeEnvelope = "LARGE_ENVELOPE"
    case mailingBox = "MAILING_BOX"
    case mediumCanadaPostBox = "MEDIUM_CANADA_POST_BOX"
    case mediumCanadaPostBubbleMailer = "MEDIUM_CANADA_POST_BUBBLE_MAILER"
    case motorbikers = "MOTORBIKES"
    case oneWayPallet = "ONE_WAY_PALLET"
    case packageThickEnvelope = "PACKAGE_THICK_ENVELOPE"
    case paddedBags = "PADDED_BAGS"
    case parcelOrPaddedEnvelope = "PARCEL_OR_PADDED_ENVELOPE"
    case roll = "ROLL"
    case smallCanadaPostBox = "SMALL_CANADA_POST_BOX"
    case smallCanadaPostBubbleMailer = "SMALL_CANADA_POST_BUBBLE_MAILER"
    case toughBags = "TOUGH_BAGS"
    case upsLetter = "UPS_LETTER"
    case uspsFlatRateEnvelope = "USPS_FLAT_RATE_ENVELOPE"
    case uspsLargePack = "USPS_LARGE_PACK"
    case veryLargePack = "VERY_LARGE_PACK"
    case winePak = "WINE_PAK"
}

public struct PackageWeightAndSize : Codable {
	var dimensions : Dimensions?
	var packageType : PackageType?
	var weight : Weight?

	enum CodingKeys: String, CodingKey {

		case dimensions
		case packageType = "packageType"
		case weight
	}

    public init() { }
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		dimensions = try Dimensions(from: decoder)
		packageType = try values.decodeIfPresent(PackageType.self, forKey: .packageType)
		weight = try Weight(from: decoder)
	}

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(dimensions, forKey: .dimensions)
        try container.encodeIfPresent(packageType, forKey: .packageType)
        try container.encodeIfPresent(weight, forKey: .weight)
    }
}
