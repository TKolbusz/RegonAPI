
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
    private static var URL = "http://lrm.local/api/admin/applications"
    func getCompanies(search:String) -> Maybe<Company> {
        if(search.isEmpty) {
            return Maybe.never()
        }
        if(API.URL.contains("http")){
            let data = Company.sampleData
            let comp :Company! = data.first{ cmp in cmp.name.contains(search) || cmp.taxIdNo.contains(search)}
            if(comp != nil){
                return Maybe.just(comp).delay(RxTimeInterval.seconds(3), scheduler: MainScheduler.instance)
            }else{
                return Maybe.never()
            }
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

        return Maybe.never()
    }
}
