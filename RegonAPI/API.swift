
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
                                let name = (result["nazwy"] as? [[String:Any]])
                                let nameFull = name["pelna"]
                                let taxIdNo = result["numery"]["nip"]
                                let registrationDate = result["krs_wpisy"]["pierwszy_data"]
                                let address = result["krs_adresy"]
                                let ceo = result["glowna_osoba"]["imiona_i_nazwisko"]
                                
                                companies.append(Company(
                                    name:"",
                                    taxIdNo:"",
                                    registrationDate: "",
                                    addressString: "",
                                    addressLat: 0,
                                    addressLong: 0,
                                    ceo:""
                                ))
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
