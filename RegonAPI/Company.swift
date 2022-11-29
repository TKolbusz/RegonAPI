
import SwiftUI

struct Company: Identifiable{
    var id: UUID
    var name: String
    var taxIdNo: String
    var addressString:String
    var addressLat: Double
    var addressLong: Double
    var registrationDate: String
    var ceo:String

    init(id: UUID = UUID(), name: String,  taxIdNo:String,registrationDate:String,addressString:String,addressLat:Double,addressLong:Double,ceo:String) {
        self.id = id
        self.name = name
        self.registrationDate = registrationDate
        self.taxIdNo = taxIdNo
        self.addressString = addressString
        self.addressLat = addressLat
        self.addressLong = addressLong
        self.ceo = ceo
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
                Company(name: "Orlen", taxIdNo: "7740001454", registrationDate: "2001-07-19",addressString: "" ,addressLat:50,addressLong:0,ceo:"Daniel"),
                Company(name: "Grupa Lotos",  taxIdNo:"5830000960", registrationDate: "2002-04-10", addressString: "" ,addressLat:30, addressLong:13,ceo:"Jan"),
                Company(name: "Energa", taxIdNo:"5252453436", registrationDate: "20017-01-08",addressString: "" , addressLat:13,addressLong:50,ceo:"Bartosz")
            ]
}
