
import Alamofire
import RxSwift
import Foundation


struct API {
    /*   func getApi() -> Observable<AnyObject?> {
     return Observable.create{ observer in
     let request = AF.request(.get, "http://someapiurl.com", parameters: nil)
     .response(completionHandler:  { request, response, data, error in
     if ((error) != nil) {
     observer.on(.Error(error!))
     } else {
     observer.on(.Next(data))
     observer.on(.Completed)
     }
     });
     return Disposable {
     request.cancel()
     }
     }
     }*/
    private static var endpoint = "https://rejestr.io/api/v2/org"
    func getCompanies(search:String) -> Observable<[Company]> {
        if(search.isEmpty) {
            return Observable.just([])
        }
        let url = try! URLRequest(url: URL(string:API.endpoint + "?nazwa=" + search)!, method: .get, headers: headers())
        
        return Observable.create { observer in
            let request = AF.request(url)
                .validate()
                .responseJSON { response in
                    //print(response)
                    switch response.result {
                    case .success(let jsonObj):
                        
                        //guard let json = try? JSON(data:response.result.value)else{fallthrough}
                       //   let json = try? JSON(data:response.result.value) else {return}
                        let json = jsonObj as! NSDictionary
                        var companies :[Company] = []
                        
                        
                        if let results = json["wyniki"] as? [[String:Any]] {
                            for result in results {
                                let name : Any? = (result["nazwy"] as? NSDictionary)?["pelna"]
                                let taxIdNo :Any? = (result["numery"] as? NSDictionary)?["nip"]
                                let registrationDate:Any? = (result["krs_wpisy"] as? NSDictionary)?["pierwszy_data"]
                                let addressCity :Any? = ( result["adres"] as? NSDictionary)?["miejscowosc"]
                                let addressStreet:Any? = ( result["adres"] as? NSDictionary)?["ulica"]
                                let addressBuildingNr:Any? = ( result["adres"] as? NSDictionary)?["nr_domu"]
                                let ceo :Any? = (result["glowna_osoba"] as? NSDictionary)?["imiona_i_nazwisko"]
                                let addressCityString = addressCity as? String ?? ""
                                let addressStreetString =  addressStreet as? String ?? ""
                                let addressBuildingNrString = addressBuildingNr as? String ?? ""
                                let address :String = addressStreetString  + " " + addressBuildingNrString + " " + addressCityString
                                
                                let company = Company(
                                    name:name as? String ?? "",
                                    taxIdNo: taxIdNo as? String ?? "",
                                    registrationDate: registrationDate as? String ?? "",
                                    addressString: address,
                                    addressLat: 0,
                                    addressLong: 0,
                                    ceo: ceo as? String ?? ""
                                )
                                companies.append(company)
                            }
                        }
                    
                        observer.on(.next(companies))
                    case .failure(let error):
                        print("error")
                        observer.on(.error(error))
                    }
                }
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    func headers() -> HTTPHeaders {
        var headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        headers["Authorization"] = "17dad445-657b-47c8-90dd-5b60f366f8d4"
        
        
        return headers
    }}
