import SwiftUI
import MapKit
import CoreLocation

struct DetailView: View {
    @ObservedObject var presenter: CompanyViewPresenter
    
    var body: some View{
        let company = presenter.company
        List{
            Section(header: Text("Dane firmy")) {
                HStack {
                    Label("Numer NIP", systemImage: "number")
                    Spacer()
                    Text("\(company.taxIdNo)")
                }
                .accessibilityElement(children:.combine)
                HStack {
                    Label("Prezes", systemImage: "person")
                    Spacer()
                    Text("\(company.ceo)")
                }
                HStack {
                    Label("Adres", systemImage: "location")
                    Spacer()
                    Text("\(company.addressString)")
                        .padding(4)
                        .cornerRadius(4)
                }
                
                .accessibilityElement(children: .combine)
                
            }
            Section(header: Text("Lokalizacja")) {
                Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: company.addressLat, longitude:company.addressLong), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))), interactionModes: [])
                    .frame(width: 400, height: 300)
                
            }
        }
        .navigationTitle(company.name)
        
    }
    
    
}

//struct DetailView_Previews: PreviewProvider {
//   static var previews: some View {
//       DetailView(company:Company.sampleData[0])
//   }
//}
