//
//  VariesBy.swift
//  ebayWebretail
//
//  Created by Gerardo Grisolini on 15/05/18.
//

import Foundation

public struct VariesBy : Codable {
	var aspectsImageVariesBy : [String]
	var specifications : [Specifications]

	enum CodingKeys: String, CodingKey {
		case aspectsImageVariesBy = "aspectsImageVariesBy"
		case specifications = "specifications"
	}

    public init(aspectsImageVariesBy: [String], specifications: [Specifications]) {
        self.aspectsImageVariesBy = aspectsImageVariesBy
        self.specifications = specifications
    }
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		aspectsImageVariesBy = try values.decode([String].self, forKey: .aspectsImageVariesBy)
		specifications = try values.decode([Specifications].self, forKey: .specifications)
	}
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(aspectsImageVariesBy, forKey: .aspectsImageVariesBy)
        try container.encode(specifications, forKey: .specifications)
    }
}
