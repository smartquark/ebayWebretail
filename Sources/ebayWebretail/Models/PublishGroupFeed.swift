//
//  PublishGroupFeed.swift
//  ebayWebretail
//
//  Created by Gerardo Grisolini on 16/05/18.
//

import Foundation

public struct PublishGroupFeed : Feed {
    var inventoryItemGroupKey : String
    var marketplaceId: String
    
    public func method() -> String {
        return "POST"
    }
    
    public func url(endpoint: Endpoint, sku: String) -> String {
        return "https://\(endpoint.rawValue)/sell/inventory/v1/offer/publish_by_inventory_item_group"
    }

    public func Data() -> Data {
        return try! JSONEncoder().encode(self)
    }
}
