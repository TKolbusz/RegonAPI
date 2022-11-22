

import Foundation
import RxSwift
import CoreData

struct Database {
    //@Environment(\.managedObjectContext) private var viewContext
    
    func getCompanies(search:String) -> Observable<[Company]> {
        let companies = Company.sampleData
        return Observable.just(companies).delay(RxTimeInterval.seconds(4), scheduler: MainScheduler.instance)
    }

    func save(companies:[Company]) ->Completable {
        Completable.deferred {
            debugPrint("saving company")
            return Completable.empty()
        }
    }
}
