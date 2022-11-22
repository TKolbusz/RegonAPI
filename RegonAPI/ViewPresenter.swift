
import Foundation
import RxSwift
import RxCocoa
import SwiftUI
import Combine
import CoreLocation

protocol ViewPresenter {
    init(dataService: DataService)
    var companies: [Company] { get }
}

final class ProductionViewPresenter: ViewPresenter, BindableObject {
    var items: [PostsListItem] = []
    var isOffline: Bool = false
    
    private let interactor: PostsInteractor
    
    init(interactor: PostsInteractor) {
        self.interactor = interactor
        self.populate()
    }
    
    // Populate list of items from RxSwift model and let SwiftUI view know about it
    internal func find(search:String) {
        dataService.getCompanies(search)
            .subscribeOn(SerialDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] companies in
                self?.items = items
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
            print("Lat: \(lat), Lon: \(lon)")
        }
        return Observable.empty()
    }
}
