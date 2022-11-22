import SwiftUI
import MapKit
import CoreLocation

struct DetailView: View {
    let company: Company
    
    var body: some View{
        List{
            Section(header: Text("Dane firmy")) {
                HStack {
                    Label("Numer NIP", systemImage: "clock")
                    Spacer()
                    Text("\(company.taxIdNo)")
                }
                .accessibilityElement(children:.combine)
                HStack {
                                    Label("Adres", systemImage: "paintpalette")
                                    Spacer()
                                    Text("Test")
                        .padding(4)
                        .cornerRadius(4)
                                }
            
                                .accessibilityElement(children: .combine)
                
            }
            Section(header: Text("Shareholders")) {
                           ForEach(company.shareholders) { shareholder in
                               Label(shareholder.name, systemImage: "person")
                           }
                       }
            Section(header: Text("Address")) {
                Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: company.addressLat, longitude:company.addressLong), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))), interactionModes: [])
                    .frame(width: 400, height: 300)
                
            }
        }
        .navigationTitle(company.name)
    }
    

}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(company:Company.sampleData[0])
    }
}
