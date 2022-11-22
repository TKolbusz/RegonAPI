
import SwiftUI

struct Company: Identifiable{
    var id: UUID
    var name: String
    var taxIdNo: String
    var addressLat: Double
    var addressLong: Double
    var registrationDate: String
    var shareholders: [Shareholder]

    init(id: UUID = UUID(), name: String, shareholders: [String], taxIdNo:String,registrationDate:String,addressLat:Double,addressLong:Double) {
        self.id = id
        self.name = name
        self.shareholders = shareholders.map {Shareholder(name:$0)}
        self.registrationDate = registrationDate
        self.taxIdNo = taxIdNo
        self.addressLat = addressLat
        self.addressLong = addressLong
    }

}
extension Company{
    struct Shareholder: Identifiable{
        let id: UUID
        var name: String

        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    struct Data {
        var name: String = ""
        var shareholders: [Shareholder] = []
        var taxIdNo:String  = ""
    }

    var data: Data {
        Data(name: name,
                shareholders:shareholders,
                taxIdNo:taxIdNo
        )
    }
}
extension Company {
    static let sampleData: [Company] =
            [
                Company(name: "Orlen", shareholders: ["Daniel"],taxIdNo: "7740001454", registrationDate: "2001-07-19", addressLat:50,addressLong:0),
                Company(name: "Grupa Lotos", shareholders: ["Karol"], taxIdNo:"5830000960", registrationDate: "2002-04-10", addressLat:30, addressLong:13),
                Company(name: "Energa", shareholders: ["Roman", "Krzysztof"], taxIdNo:"5252453436", registrationDate: "20017-01-08", addressLat:13,addressLong:50)
            ]
}
