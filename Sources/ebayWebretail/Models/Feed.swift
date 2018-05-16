//
//  Feed.swift
//  ebayWebretail
//
//  Created by Gerardo Grisolini on 16/05/18.
//

import Foundation

public protocol Feed : Codable {

    func method() -> String

    func url(endpoint: Endpoint, sku: String) -> String

    func Data() -> Data
}
