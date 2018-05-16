import Foundation

public class ebayService : NSObject {
    
    private let cfg: Config
  
    public init(config: Config) {
        self.cfg = config
        super.init()
    }

    private func headers() -> [String : String] {
        var headers = [String : String]()
        headers["Authorization"] = "Bearer \(cfg.accessToken)"
        headers["Accept"] = "application/json"
        headers["Content-Type"] = "application/json; charset=UTF-8"
        headers["Content-Language"] = cfg.locale
        headers["X-EBAY-C-MARKETPLACE-ID"] = cfg.marketplaceId
        return headers
    }
    
    public func send(feed: RequestFeed, completionHandler: @escaping ((RequestFeed?) -> (Void))) {
        
        let url = feed.requestFeed.url(endpoint: cfg.endpoint, sku: feed.requestSku)
        
        var request = URLRequest(url: URL(string: url)!)
        request.allHTTPHeaderFields = self.headers()
        request.httpMethod = feed.requestFeed.method()
        request.httpBody = feed.requestFeed.Data()
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            feed.requestSubmittedAt = Int.now()
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200 && httpResponse.statusCode != 204 {
                    print(httpResponse.statusCode)
                    feed.messagesWithError = 1
                    feed.errorDescription = "statusCode: \(httpResponse.statusCode)"
                    return
                }
            }

            if let error = error {
                feed.messagesWithError = 1
                feed.errorDescription = error.localizedDescription
            }
            
            if let data = data {
                if feed.requestFeed is OfferFeed {
                    let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String : Any]
                    if let json = json {
                        feed.requestSubmissionId = json["offerId"] as? String ?? ""
                    }
                } else if feed.requestFeed is PublishFeed {
                    let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String : Any]
                    if let json = json {
                        feed.requestSubmissionId = json["listingId"] as? String ?? ""
                    }
                } else {
                    let resp = try? JSONDecoder().decode(Response.self, from: data)
                    if let warnings = resp?.warnings {
                        for w in warnings {
                            feed.messagesWithWarning += 1
                            feed.errorDescription = w.message!
                        }
                    }
                }
            }
            
            completionHandler(feed)
        }
        task.resume()
    }
}
