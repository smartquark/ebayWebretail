//
//  PublishFeed.swift
//  ebayWebretail
//
//  Created by Gerardo Grisolini on 16/05/18.
//

import Foundation

public struct PublishFeed : Feed {
    var offerId : String

    public func method() -> String {
        return "POST"
    }
    
    public func url(endpoint: Endpoint, sku: String) -> String {
        return "https://\(endpoint.rawValue)/sell/inventory/v1/offer/publish/\(offerId)"
    }
    
    public func Data() -> Data {
        return Data()
    }
}
