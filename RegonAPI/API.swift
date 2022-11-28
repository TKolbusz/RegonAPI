
import Alamofire
import RxSwift


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
    private static var URL = "https://rejestr.io/api/v2/org"
    func getCompanies(search:String) -> Observable<[Company]> {
        if(search.isEmpty) {
            return Observable.just([])
        }
        return Observable.create{ observer in
            let request = AF.request(API.URL + "?nazwa=" + search, method:.get)
            request.responseJSON{
                (response) in
                if let status = response.response?.statusCode {
                    switch(status){
                        case 201:
                            print("example success")
                        default:
                            print("error with response status: \(status)")
                                    }
                                }
                //to get JSON return value
                            if let result = response.result.value {
                                let JSON = result as! NSDictionary
                                print(JSON)
                            }
            }
            let companies = [Company.sampleData[0]]
            
            observer.onNext(companies)
            return Disposables.create{
                request.cancel()
            }
        }
    }
}
