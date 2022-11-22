
import Foundation
import RxSwift
import SwiftUI
import Combine
import CoreLocation

protocol ViewPresenter {
    init(dataService: DataService)
    var companies: [Company] { get }
}

final class ProductionViewPresenter: ViewPresenter, ObservableObject {

    @Published var companies: [Company] = []
    
    private let dataService:DataService
    
    init(dataService: DataService) {
        self.dataService = dataService
        self.find(search:"")
    }
    
    // Populate list of items from RxSwift model and let SwiftUI view know about it
    internal func find(search:String) {
        debugPrint("searching for " + search)
        dataService.getCompanies(search:search)
            .subscribeOn(SerialDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] companies in
                debugPrint("found " + String(companies.count))
                self?.companies = companies
               // self?.isOffline = false
                self?.didChange.send()
            }, onError: { [weak self] error in
               // self?.isOffline = true
                self?.didChange.send()
            })
            .disposed(by: self.disposeBag)
    }
    var didChange = PassthroughSubject<Void, Never>()
    private let disposeBag = DisposeBag()

    // Get details associated with each post, preserving order for later sorting
    private func mergeDetails(_ companies: [Company]) -> Observable<[Company]> {
   
        var geocoder = CLGeocoder()
        geocoder.geocodeAddressString("your address") {
            placemarks, error in
            let placemark = placemarks?.first
            let lat = placemark?.location?.coordinate.latitude
            let lon = placemark?.location?.coordinate.longitude
            //print("Lat: \(lat), Lon: \(lon)")
        }
        return Observable.empty()
    }
}
