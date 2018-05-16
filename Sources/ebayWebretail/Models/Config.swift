//
//  Config.swift
//  ebayWebretail
//
//  Created by Gerardo Grisolini on 15/05/18.
//

import Foundation

public enum Endpoint: String, Codable {
    case sandbox = "api.sandbox.ebay.com"
    case production = "api.ebay.com"
}

public struct Config : Codable {
    let endpoint: Endpoint
    let marketplaceId: String
    let locale: String
    let accessToken: String
    
    public init(
        endpoint: Endpoint,
        marketplaceId: String,
        locale: String,
        accessToken: String
    ) {
        self.endpoint = endpoint
        self.marketplaceId = marketplaceId
        self.locale = locale
        self.accessToken = accessToken
    }
}
