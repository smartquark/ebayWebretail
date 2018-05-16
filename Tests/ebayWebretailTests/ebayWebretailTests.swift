import XCTest
@testable import ebayWebretail

final class ebayWebretailTests: XCTestCase {
    
    let accessToken = "v^1.1#i^1#r^0#f^0#I^3#p^3#t^H4sIAAAAAAAAAOVXe2wURRzuXR8GsWjQaIOo52IiQvZu9nWPDXd4bSmc0gdci1CDZHZ3tl3Z273sztIeCbFpSEXjAwWiiJFG/yCxQUQMWAhJ0cQECISXiCaGNKAQJEY0oEESnb1e22sN0AcmTbx/LjPz+36P7/fN7AxoK5k0q2NBxx+lnru8nW2gzevxMJPBpJLi2VMKvdOKC0Cegaez7Ym2ovbCi3NsmNLT4mJkp03DRr7WlG7YYnYySjmWIZrQ1mzRgClki1gWk/HqhSLrB2LaMrEpmzrlS1RGKUXgIRtWACsHVSgLgMwa/T7rzSglADWkIE7hmBDDRBBH1m3bQQnDxtDAUYoFTJgGAs0E6xlBBLzI8X4+GGmkfEuQZWumQUz8gIpl0xWzWCsv11unCm0bWZg4oWKJeFWyNp6onFdTPyeQ5yuW4yGJIXbsoaMKU0G+JVB30K3D2FlrMenIMrJtKhDrizDUqRjvT2YM6WepZpiQwPPBYCjIhxk2xN8RKqtMKwXxrfNwZzSFVrOmIjKwhjO3Y5SwIb2IZJwb1RAXiUqf+7fIgbqmasiKUvPK48sakvMWU75kXZ1lrtIUpGQr5XhGYFkmRMUwsgmFyFrRhCxoKaa/ydJsU9cMLRe0z3OO8mFRK0xD0VwCbV+NicsRqQAN5YkXhTyeiFGtUWvFVexml28X6udTCDW6De7rqIObDbfHKEVI8WWHt+9GvzwGBXGnBMLJERnyKhR4ieUZTskKxN3r4xRJzO1TvK4u4OaCJJihU9BaiXBahzKiZUKvk0KWpoicoLJcWEW0EoyoNB9RVVoSlCDNqAgBhCRJjoT/r1rB2NIkB6MBvQxfyBYcpZKymUZ1JGs5Qw03yZ5FOXW02lGqGeO0GAi0tLT4Wzi/aTUFWACYwNLqhUm5GaUgNWCr3d6Y1rIakRFB2ZqIM2mSTSuRIQluNFExzlLqoIUz5U6GjJNIJ8Q29Ut5SIax4bM3KdV2S51YRbp4mziAac3vKt0vm6mACcnOdqdWZDP2jcQoIDkZEl9Blt9CUDENPTNyXJNDlNyHHhnIJt3wp6C7192NSUoZZdScgxx4FBjNWEW0bFqZsQQcAI8CA2XZdAw8lnA56CgQqqOrmq6723UsAfPgo0nTgHoGa7I99h5mT2ZCr601NePR+iFz5DgneBliqJuDUhrXZo+n0wllYm32+X2fifn0c0iyEIYanSxfSsssEoQICyGNJI7h5KA0rror0ar/pO6idu/6cdQOoBpCIYmnQ1ByP9UhQEthFtI8B1iWRwoLVDiuuit0jci+PjPRTvgFpo2RMr7SyKVrYhXl6rZftjJgIB0Oq4DmZUS6GgxytMrKwkhLDtz0vvKva2tg6BsyVpD9Me2e/aDd002eoYDIipkNniopbCgqvIeyNYz8NjQUyWz1a1D1k/PJIE8kC/lXokwaapa3xPP8w5fm3sh7vXYuB2UD79dJhczkvMcsmD64Uszc+1ApEwYCE2QEwHN8I5gxuFrEPFj0wHRv1W/lzOfCjKuHncZF53vWb3BkUDpg5PEUFxS1ewqKe3c5j24+0s29NvNo/NzTh9p2LNtWtWn/wWpe77kxfc1f3VM7/jx2gp/JSGu7Zmx78vEf7Qtlp3s2bnprz56FvQ2X3+7VD37Seu347/uefX9a1xvh2vVTC8p6/74Ofn1M23mu63TDxs3lhzR9e8/Jb7s6Nkzprjm1Zt3FH65deOSZb8JbFp1ZsWnW9fjeis7kC2dPtXy4/wP85p4vPF9vWdtwerklfLYXX169u/WK+tFXpfqZ0vafq++Wdhx7+dLrV5Lp++ae3eldELz/07nls1ev+/LEztDMqzUvpd47cHLd91uP+BLi4eOVp7wZWHTlHf+B+ZVHo1vLtif3TfW+eubdQrDr493fvfLL41PO/5TY2tfGfwCoCcQrVxAAAA=="
    lazy var config = Config(endpoint: .sandbox, marketplaceId: "EBAY_IT", locale: "it-IT", accessToken: self.accessToken)

    func testSingleItem() {
        var availability = Availability()
        availability.shipToLocationAvailability = ShipToLocationAvailability(quantity: 1)
        var product = Product()
        product.brand = "Grisolini"
        product.title = "Gaia"
        product.subtitle = "Gaia (Unique, Neutral)"
        product.description = "Single product no variants for test."
        product.ean = ["6889865440152"]
        product.aspects = [
            "Color": ["Neutral"],
            "Size": ["Unique"]
        ]
        product.imageUrls = [
            "http://www.webretail.cloud/media/hwe9-8bZyaEga54mxDXnMg.jpg"
        ]
        let feed = ProductFeed(availability: availability, condition: .new, product: product)
        
        let expectation = XCTestExpectation(description: "eBay API")
        let service = ebayService(config: config)
        service.createOrReplaceInventoryItem(sku: "GAIA12322", feed: feed) { result -> (Void) in
            expectation.fulfill()
            XCTAssertNil(result)
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testGroupItem() {
        var feed = GroupFeed()
        feed.aspects = ["Wool"]
        feed.title = "Gerardo"
        feed.description = "Grouped product with variants for test."
        feed.imageUrls = [
            "http://www.webretail.cloud/media/2gITOx2cNUxYfFdMua1bfw.jpg",
            "http://www.webretail.cloud/media/hwe9-8bZyaEga54mxDXnMg.jpg"
        ]
        feed.variantSKUs = [
            "WEB1002244-1",
            "WEB1002244-2",
            "WEB1002244-3"
        ]
        let aspectsImageVariesBy = ["Color", "Size"]
        let specifications = [
            Specifications(name: "Color", values: ["White"]),
            Specifications(name: "Size", values: ["Small", "Medium", "Large"]),
        ]
        feed.variesBy = VariesBy(aspectsImageVariesBy: aspectsImageVariesBy, specifications: specifications)
        
        let expectation = XCTestExpectation(description: "eBay API")
        let service = ebayService(config: config)
        service.createOrReplaceInventoryItemGroup(key: "WEB1002244", feed: feed) { result -> (Void) in
            expectation.fulfill()
            XCTAssertNil(result)
        }
        wait(for: [expectation], timeout: 10.0)
    }

    static var allTests = [
        ("testSingleItem", testSingleItem),
        ("testGroupItem", testGroupItem),
    ]
}
