//
//  ListingPolicies.swift
//  ebayWebretail
//
//  Created by Gerardo Grisolini on 15/05/18.
//

import Foundation

public struct ListingPolicies : Codable {
	let fulfillmentPolicyId : Int?
	let paymentPolicyId : Int?
	let returnPolicyId : Int?

	enum CodingKeys: String, CodingKey {
		case fulfillmentPolicyId = "fulfillmentPolicyId"
		case paymentPolicyId = "paymentPolicyId"
		case returnPolicyId = "returnPolicyId"
	}

    public init(fulfillmentPolicyId: Int, paymentPolicyId: Int, returnPolicyId: Int) {
        self.fulfillmentPolicyId = fulfillmentPolicyId
        self.paymentPolicyId = paymentPolicyId
        self.returnPolicyId = returnPolicyId
    }

    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		fulfillmentPolicyId = try values.decodeIfPresent(Int.self, forKey: .fulfillmentPolicyId)
		paymentPolicyId = try values.decodeIfPresent(Int.self, forKey: .paymentPolicyId)
		returnPolicyId = try values.decodeIfPresent(Int.self, forKey: .returnPolicyId)
	}
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(fulfillmentPolicyId, forKey: .fulfillmentPolicyId)
        try container.encode(paymentPolicyId, forKey: .paymentPolicyId)
        try container.encode(returnPolicyId, forKey: .returnPolicyId)
    }
}
