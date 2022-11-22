

import Foundation
import RxSwift

struct Database {
    func getCompanies(search:String) -> Maybe<Company> {
        let comp = Company.sampleData[0]
        return Maybe.just(comp).delay(RxTimeInterval.seconds(4), scheduler: MainScheduler.instance)
    }

    func save(company:Company) ->Completable {
        Completable.deferred {
            debugPrint("saving company")
            return Completable.empty()
        }
    }
}
