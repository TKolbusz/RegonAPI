
import SwiftUI

struct Company: Identifiable{
    var id: UUID
    var name: String
    var taxIdNo: String
    var address: String
    var registrationDate: String
    var shareholders: [Shareholder]
    
    init(id: UUID = UUID(), name: String, shareholders: [String], taxIdNo:String) {
            self.id = id
            self.name = name
        self.shareholders = shareholders.map {Shareholder(name:$0)}
        self.taxIdNo = taxIdNo
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
        Company(name: "Orlen", shareholders: ["Daniel"],taxIdNo: "7740001454",address:"Chemikow 7 Plock",registrationDate:"2001-07-19"),
        Company(name: "Grupa Lotos", shareholders: ["Karol"], taxIdNo:"5830000960",address:"Elblaska 135 Gdansk",registrationDate:"2002-04-10",
        Company(name: "Energa", shareholders: ["Roman", "Krzysztof"], taxIdNo:"5252453436",address:"Grunwaldzka 472 Gdansk",registrationDate:"20017-01-08")
    ]
}
