//
//  CompanyViewPresenter.swift
//  RegonAPI
//
//  Created by Guest User on 06/12/2022.
//

import Foundation
import RxSwift
import SwiftUI
import Combine
import CoreLocation

protocol CViewPresenter {
    init(company:Company)
    var company: Company { get }
}

final class CompanyViewPresenter: CViewPresenter, ObservableObject {

    @Published var company:Company
        
    init(company:Company) {
        self.company=company
        self.findGeoLocation(address:company.addressString)
    }
    
    internal func findGeoLocation(address:String) {
        debugPrint("searching for geo location " + address)
        
        Observable<Company>.create { observer in
            var geocoder = CLGeocoder()
            geocoder.geocodeAddressString(address) {
                placemarks, error in
                let placemark = placemarks?.first
                let lat = placemark?.location?.coordinate.latitude
                let lon = placemark?.location?.coordinate.longitude
                print("Lat: \(lat), Lon: \(lon)")
                let companyWithGeoLocation :Company = self.company.withGeoLocation(coords: placemark?.location?.coordinate ?? CLLocationCoordinate2D(latitude: CLLocationDegrees(0), longitude: CLLocationDegrees(0)))
                observer.on(.next(companyWithGeoLocation))
            }
            return Disposables.create {}
        }
        .subscribeOn(SerialDispatchQueueScheduler(qos: .background))
        .observeOn(MainScheduler.instance)
        .subscribe(onNext: { [weak self] company in
            self?.company = company
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
}
