
import SwiftUI

struct Company: Identifiable{
    var id: UUID
    var name: String
    var taxIdNo: String
    var addressLat: Double
    var addressLong: Double
    var registrationDate: String

    init(id: UUID = UUID(), name: String,  taxIdNo:String,registrationDate:String,addressLat:Double,addressLong:Double) {
        self.id = id
        self.name = name
        self.registrationDate = registrationDate
        self.taxIdNo = taxIdNo
        self.addressLat = addressLat
        self.addressLong = addressLong
    }

}
extension Company{
    
    struct Data {
        var name: String = ""
        var taxIdNo:String  = ""
    }

    var data: Data {
        Data(
            name: name,
            taxIdNo:taxIdNo
        )
    }
}
extension Company {
    static let sampleData: [Company] =
            [
                Company(name: "Orlen", taxIdNo: "7740001454", registrationDate: "2001-07-19", addressLat:50,addressLong:0),
                Company(name: "Grupa Lotos",  taxIdNo:"5830000960", registrationDate: "2002-04-10", addressLat:30, addressLong:13),
                Company(name: "Energa", taxIdNo:"5252453436", registrationDate: "20017-01-08", addressLat:13,addressLong:50)
            ]
}
