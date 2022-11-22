
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
    private static var URL = "http://test.com"
    func getCompanies(search:String) -> Observable<[Company]> {
        if(search.isEmpty) {
            return Observable.never()
        }
        if(API.URL.contains("http")){
            let data = Company.sampleData
            let companies :[Company] = data.filter{ cmp in cmp.name.contains(search) || cmp.taxIdNo.contains(search)}
            return Observable.just(companies).delay(RxTimeInterval.seconds(3), scheduler: MainScheduler.instance)
        }
        let serializer = DataResponseSerializer(emptyResponseCodes:Set([200,204,205]))
        AF.request(API.URL, method:.get).uploadProgress{progress in }
                .response(responseSerializer: serializer){
                    response in
                    if(response.error==nil){
                        var responseString:String!
                        if(response.data != nil){
                            responseString = String(bytes:response.data!,encoding: .utf8)
                        }else{
                            responseString = response.response?.description
                        }
                        print(responseString ?? "empty")
                        print(response.response?.statusCode)
                    }
                }

        return Observable.never()
    }
}
