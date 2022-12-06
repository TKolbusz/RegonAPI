import Foundation
import RxSwift

struct DataService {
    private static var URL = "todo"

    private let api = API()
    private let database = Database()
    

    func getCompanies(search: String) -> Observable<[Company]> {
        return Observable.amb(
                [
                    api.getCompanies(search: search).asObservable().do(onNext: { _ in debugPrint("company found via api call")}),
                    database.getCompanies(search: search).asObservable().do(onNext: { _ in debugPrint("company found via database")})
                ]
        )
                .flatMap({companies in database.save(companies: companies).andThen(Observable.just(companies))})
    }
}
